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
  static const double relationshipLaneSpacing = 18;
  static const double childLaneSpacing = 14;
  static const double _halfPerson = personSize / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final peopleById = {for (final p in snapshot.people) p.id: p};
    final relLane = _relationshipLaneMap(snapshot);

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

    // Relationships: draw a direct (diagonal allowed) segment between members.
    // We offset parallel segments slightly (lanes) so multiple unions don't overlap.
    for (final r in snapshot.relationships) {
      final a = peopleById[r.memberAId];
      final b = peopleById[r.memberBId];
      if (a == null || b == null) continue;
      final p1 = Offset(a.centerX, a.centerY);
      final p2 = Offset(b.centerX, b.centerY);
      final isSel = r.id == selectedRelationshipId;
      final relPaint = isSel ? paintRelSelected : paintRel;
      final lane = relLane[r.id] ?? 0;
      final relGeom = _relationshipGeometry(p1, p2, lane: lane);
      canvas.drawLine(relGeom.a, relGeom.b, relPaint);

      // Children: route from union anchor down to each child.
      final children = snapshot.relationshipChildren[r.id] ?? const <int>[];
      if (children.isNotEmpty) {
        final anchor = relGeom.mid;
        for (var i = 0; i < children.length; i++) {
          final childId = children[i];
          final c = peopleById[childId];
          if (c == null) continue;
          final pc = Offset(c.centerX, c.centerY);
          final spread = (i - (children.length - 1) / 2) * childLaneSpacing;
          // Spread along the relationship segment, so child connectors start ON the union line.
          final childAnchor = anchor + (relGeom.dir * spread);
          final childAttach = _attachToPersonBox(
            center: pc,
            toward: childAnchor,
          );
          canvas.drawLine(childAnchor, childAttach, paintChild);
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

  /// Attachment point on the person symbol perimeter, using a 4-side box model.
  /// This keeps connections cleaner than always using the center.
  Offset _attachToPersonBox({required Offset center, required Offset toward}) {
    final d = toward - center;
    final dx = d.dx;
    final dy = d.dy;
    if (dx.abs() < 1e-6 && dy.abs() < 1e-6) {
      return center;
    }

    // Pick the dominant axis, so we attach to top/bottom/left/right midpoints.
    if (dx.abs() >= dy.abs()) {
      final sx = dx >= 0 ? 1.0 : -1.0;
      final x = center.dx + sx * _halfPerson;
      return Offset(x, center.dy);
    } else {
      final sy = dy >= 0 ? 1.0 : -1.0;
      final y = center.dy + sy * _halfPerson;
      return Offset(center.dx, y);
    }
  }

  _RelGeometry _relationshipGeometry(
    Offset p1,
    Offset p2, {
    required int lane,
  }) {
    // Direction between the two people centers.
    final v0 = p2 - p1;
    final len0 = v0.distance;
    final dir0 = len0 < 1e-6 ? const Offset(1, 0) : (v0 / len0);
    final normal = len0 < 1e-6
        ? const Offset(0, -1)
        : Offset(-dir0.dy, dir0.dx);

    // Shift the line in a parallel lane, but re-attach to each person's perimeter
    // so the line still "touches" the symbol.
    final offset = normal * (lane * relationshipLaneSpacing);
    final toward2 = p2 + offset;
    final toward1 = p1 + offset;

    final a = _attachToPersonBox(center: p1, toward: toward2);
    final b = _attachToPersonBox(center: p2, toward: toward1);

    final v = b - a;
    final len = v.distance;
    final dir = len < 1e-6 ? const Offset(1, 0) : (v / len);
    final mid = Offset((a.dx + b.dx) / 2, (a.dy + b.dy) / 2);
    return _RelGeometry(a: a, b: b, mid: mid, dir: dir, normal: normal);
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

  Map<int, int> _relationshipLaneMap(PedigreeSnapshot snapshot) {
    final perPerson = <int, List<int>>{};
    for (final r in snapshot.relationships) {
      perPerson.putIfAbsent(r.memberAId, () => []).add(r.id);
      perPerson.putIfAbsent(r.memberBId, () => []).add(r.id);
    }
    for (final e in perPerson.entries) {
      e.value.sort();
    }
    final lanes = <int, int>{};
    for (final r in snapshot.relationships) {
      final aList = perPerson[r.memberAId] ?? const <int>[];
      final bList = perPerson[r.memberBId] ?? const <int>[];
      final aIdx = aList.indexOf(r.id);
      final bIdx = bList.indexOf(r.id);
      lanes[r.id] = math.max(aIdx < 0 ? 0 : aIdx, bIdx < 0 ? 0 : bIdx);
    }
    return lanes;
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

class _RelGeometry {
  const _RelGeometry({
    required this.a,
    required this.b,
    required this.mid,
    required this.dir,
    required this.normal,
  });

  final Offset a;
  final Offset b;
  final Offset mid;
  final Offset dir;
  final Offset normal;
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

Offset attachToPersonBox({
  required Offset center,
  required Offset toward,
  required double personSize,
}) {
  final half = personSize / 2;
  final d = toward - center;
  final dx = d.dx;
  final dy = d.dy;
  if (dx.abs() < 1e-6 && dy.abs() < 1e-6) {
    return center;
  }

  if (dx.abs() >= dy.abs()) {
    final sx = dx >= 0 ? 1.0 : -1.0;
    final x = center.dx + sx * half;
    return Offset(x, center.dy);
  } else {
    final sy = dy >= 0 ? 1.0 : -1.0;
    final y = center.dy + sy * half;
    return Offset(center.dx, y);
  }
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
  final relLane = PedigreePainter(
    snapshot: snapshot,
    selectedPersonId: null,
    selectedRelationshipId: null,
  )._relationshipLaneMap(snapshot);
  for (final r in snapshot.relationships) {
    final a = peopleById[r.memberAId];
    final b = peopleById[r.memberBId];
    if (a == null || b == null) continue;
    final p1 = Offset(a.centerX, a.centerY);
    final p2 = Offset(b.centerX, b.centerY);
    final lane = relLane[r.id] ?? 0;
    // Partnership segment (same logic as painter): direct line with lane offset,
    // then re-attach to each person's perimeter so it touches the symbol.
    final v0 = p2 - p1;
    final len0 = v0.distance;
    final dir0 = len0 < 1e-6 ? const Offset(1, 0) : (v0 / len0);
    final normal =
        len0 < 1e-6 ? const Offset(0, -1) : Offset(-dir0.dy, dir0.dx);
    final offset = normal * (lane * PedigreePainter.relationshipLaneSpacing);
    final toward2 = p2 + offset;
    final toward1 = p1 + offset;

    final segA = attachToPersonBox(
      center: p1,
      toward: toward2,
      personSize: PedigreePainter.personSize,
    );
    final segB = attachToPersonBox(
      center: p2,
      toward: toward1,
      personSize: PedigreePainter.personSize,
    );

    final dPartnership = distanceToSegment(worldPos, segA, segB);
    if (dPartnership < thresholdWorld && dPartnership < bestDist) {
      bestDist = dPartnership;
      bestId = r.id;
    }

    final v = segB - segA;
    final len = v.distance;
    final dir = len < 1e-6 ? const Offset(1, 0) : (v / len);
    final anchor = Offset((segA.dx + segB.dx) / 2, (segA.dy + segB.dy) / 2);

    final children = snapshot.relationshipChildren[r.id] ?? const <int>[];
    for (var idx = 0; idx < children.length; idx++) {
      final childId = children[idx];
      final c = peopleById[childId];
      if (c == null) continue;
      final pc = Offset(c.centerX, c.centerY);
      final spread =
          (idx - (children.length - 1) / 2) * PedigreePainter.childLaneSpacing;
      final childAnchor = anchor + (dir * spread);
      final childAttach = attachToPersonBox(
        center: pc,
        toward: childAnchor,
        personSize: PedigreePainter.personSize,
      );
      final dChild = distanceToSegment(worldPos, childAnchor, childAttach);
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
