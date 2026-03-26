import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../domain/entities/pedigree_snapshot.dart';

class PedigreePainter extends CustomPainter {
  PedigreePainter({
    required this.snapshot,
    required this.selectedPersonId,
    required this.selectedRelationshipId,
    this.connectLineStart,
    this.connectLineEnd,
  });

  final PedigreeSnapshot snapshot;
  final int? selectedPersonId;
  final int? selectedRelationshipId;

  /// Rubber-band line while connecting (world coords).
  final Offset? connectLineStart;
  final Offset? connectLineEnd;

  static const double personSize = 48;

  @override
  void paint(Canvas canvas, Size size) {
    final peopleById = {for (final p in snapshot.people) p.id: p};

    final paintRel = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black87;

    final paintRelSelected = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = const Color(0xFF4F46E5);

    final paintChild = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black54;

    // Relationships: draw line between members.
    for (final r in snapshot.relationships) {
      final a = peopleById[r.memberAId];
      final b = peopleById[r.memberBId];
      if (a == null || b == null) continue;
      final p1 = Offset(a.centerX, a.centerY);
      final p2 = Offset(b.centerX, b.centerY);
      final isSel = r.id == selectedRelationshipId;
      canvas.drawLine(p1, p2, isSel ? paintRelSelected : paintRel);

      // Children: simple vertical from midpoint to each child.
      final children = snapshot.relationshipChildren[r.id] ?? const <int>[];
      if (children.isNotEmpty) {
        final mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
        for (final childId in children) {
          final c = peopleById[childId];
          if (c == null) continue;
          final pc = Offset(c.centerX, c.centerY);
          canvas.drawLine(mid, pc, paintChild);
        }
      }
    }

    // Rubber-band preview (connect mode).
    final cs = connectLineStart;
    final ce = connectLineEnd;
    if (cs != null && ce != null) {
      final dash = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = const Color(0xFF4F46E5);
      _drawDashedLine(canvas, cs, ce, dash);
    }

    // People: draw symbols.
    for (final p in snapshot.people) {
      final center = Offset(p.centerX, p.centerY);
      final rect = Rect.fromCenter(
        center: center,
        width: personSize,
        height: personSize,
      );

      final isSelected = p.id == selectedPersonId;
      final border = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? 4 : 3
        ..color = isSelected ? const Color(0xFF4F46E5) : Colors.black87;

      final fill = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white;

      final sex = (p.sex ?? 'U').toUpperCase();
      if (sex == 'M') {
        canvas.drawOval(rect, fill);
        canvas.drawOval(rect, border);
      } else if (sex == 'F') {
        canvas.drawRect(rect, fill);
        canvas.drawRect(rect, border);
      } else {
        canvas.drawOval(rect, fill);
        canvas.drawOval(rect, border);
        final cross = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = border.strokeWidth
          ..color = border.color;
        canvas.drawLine(rect.topLeft, rect.bottomRight, cross);
        canvas.drawLine(rect.topRight, rect.bottomLeft, cross);
      }
    }

    _paintGrid(canvas, size);
  }

  void _drawDashedLine(Canvas canvas, Offset a, Offset b, Paint paint) {
    const dash = 12.0;
    const gap = 8.0;
    final d = b - a;
    final len = d.distance;
    if (len < 0.001) return;
    final dir = d / len;
    final dx = dir.dx;
    final dy = dir.dy;
    double t = 0;
    while (t < len) {
      final seg = math.min(dash, len - t);
      final p0 = a + Offset(dx * t, dy * t);
      final p1 = a + Offset(dx * (t + seg), dy * (t + seg));
      canvas.drawLine(p0, p1, paint);
      t += dash + gap;
    }
  }

  void _paintGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black.withValues(alpha: 0.05);

    const step = 100.0;
    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant PedigreePainter oldDelegate) {
    return oldDelegate.snapshot != snapshot ||
        oldDelegate.selectedPersonId != selectedPersonId ||
        oldDelegate.selectedRelationshipId != selectedRelationshipId ||
        oldDelegate.connectLineStart != connectLineStart ||
        oldDelegate.connectLineEnd != connectLineEnd;
  }
}

int? hitTestPersonId({
  required PedigreeSnapshot snapshot,
  required Offset worldPos,
}) {
  for (final p in snapshot.people) {
    final dx = p.centerX - worldPos.dx;
    final dy = p.centerY - worldPos.dy;
    if (math.sqrt(dx * dx + dy * dy) <= PedigreePainter.personSize * 0.6) {
      return p.id;
    }
  }
  return null;
}

/// Distance from [p] to segment [a]–[b].
double distanceToSegment(Offset p, Offset a, Offset b) {
  final ab = b - a;
  final ap = p - a;
  final ab2 = ab.dx * ab.dx + ab.dy * ab.dy;
  final t = ab2 < 1e-6
      ? 0.0
      : ((ap.dx * ab.dx + ap.dy * ab.dy) / ab2).clamp(0.0, 1.0);
  final proj = a + Offset(ab.dx * t, ab.dy * t);
  return (p - proj).distance;
}

/// Parent–parent segment and mid–child connector segments for that union.
/// [scale] maps canvas zoom so [thresholdScreenPixels] stays a comfortable tap width on screen.
int? hitTestPartnershipLineId({
  required PedigreeSnapshot snapshot,
  required Offset worldPos,
  double scale = 1.0,
  double thresholdScreenPixels = 28,
}) {
  if (scale <= 0) scale = 1.0;
  final thresholdWorld = thresholdScreenPixels / scale;
  final peopleById = {for (final p in snapshot.people) p.id: p};
  int? bestId;
  var bestDist = double.infinity;
  for (final r in snapshot.relationships) {
    final a = peopleById[r.memberAId];
    final b = peopleById[r.memberBId];
    if (a == null || b == null) continue;
    final p1 = Offset(a.centerX, a.centerY);
    final p2 = Offset(b.centerX, b.centerY);
    final dPartnership = distanceToSegment(worldPos, p1, p2);
    if (dPartnership < thresholdWorld && dPartnership < bestDist) {
      bestDist = dPartnership;
      bestId = r.id;
    }

    final mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
    final children = snapshot.relationshipChildren[r.id] ?? const <int>[];
    for (final childId in children) {
      final c = peopleById[childId];
      if (c == null) continue;
      final pc = Offset(c.centerX, c.centerY);
      final dChild = distanceToSegment(worldPos, mid, pc);
      if (dChild < thresholdWorld && dChild < bestDist) {
        bestDist = dChild;
        bestId = r.id;
      }
    }
  }
  return bestId;
}

int? hitTestRelationshipId({
  required PedigreeSnapshot snapshot,
  required Offset worldPos,
}) {
  const threshold = 28.0;
  int? bestId;
  double bestDist = double.infinity;

  final peopleById = {for (final p in snapshot.people) p.id: p};
  for (final r in snapshot.relationships) {
    final a = peopleById[r.memberAId];
    final b = peopleById[r.memberBId];
    if (a == null || b == null) continue;
    final mid = Offset(
      (a.centerX + b.centerX) / 2,
      (a.centerY + b.centerY) / 2,
    );
    final d = (mid - worldPos).distance;
    if (d < threshold && d < bestDist) {
      bestDist = d;
      bestId = r.id;
    }
  }
  return bestId;
}
