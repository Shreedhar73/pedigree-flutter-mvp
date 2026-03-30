import 'dart:async';

import 'package:flutter/gestures.dart' show kTouchSlop;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/routes.dart';
import '../../domain/cascade/person_lineage_cascade.dart';
import '../../domain/entities/pedigree_snapshot.dart';
import '../bloc/pedigree_bloc.dart';
import '../person_editor/person_main_details_sheet.dart';
import '../utils/dialog_gesture_guard.dart';
import 'pedigree_painter.dart';

enum _CanvasTool {
  /// Drag from a person draws a rubber-band line; release on another person or union midpoint.
  connect,

  /// Drag moves the selected person; does not create relationships by dragging.
  move,
}

class CanvasScreen extends StatefulWidget {
  const CanvasScreen({super.key, this.pedigreeId});

  /// From [RouteSettings.arguments] when navigating with [AppRoutes.canvas].
  final int? pedigreeId;

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  // Viewport transform (world -> screen): translate + scale.
  double _scale = 1.0;
  Offset _pan = Offset.zero;

  // Pinch-zoom gesture state (prevents compounding scale each update).
  double? _gestureStartScale;
  Offset? _gestureStartFocalWorld;

  _CanvasTool _canvasTool = _CanvasTool.connect;

  int? _selectedPersonId;
  int? _selectedRelationshipId;

  /// Connect mode: line from person center to finger.
  int? _lineFromPersonId;
  Offset? _lineEndWorld;

  /// Before the drag exceeds a small threshold, we only have a candidate (no rubber band yet).
  int? _connectCandidatePersonId;
  Offset? _connectDragStartWorld;

  // Move mode: drag person to move.
  int? _dragPersonId;
  Offset? _dragStartWorld;
  Offset? _dragStartPersonCenter;
  bool _didMove = false;
  String _newPersonSex = 'F';

  Timer? _doubleTapResetTimer;
  int? _pendingDoubleTapPersonId;
  DateTime? _firstPointerDownTime;

  /// Tracks pointer-down positions so taps are recognized even when the scale
  /// recognizer wins (e.g. tapping thin relationship lines).
  final Map<int, Offset> _pointerDownLocal = {};

  DateTime? _lastTapUpAt;
  Offset? _lastTapUpLocal;

  Offset _toWorld(Offset local) {
    return (local - _pan) / _scale;
  }

  void _onCanvasPointerDown(PointerDownEvent e, PedigreeSnapshot snapshot) {
    final world = _toWorld(e.localPosition);
    final id = hitTestPersonId(snapshot: snapshot, worldPos: world);
    if (id == null) {
      _pendingDoubleTapPersonId = null;
      _firstPointerDownTime = null;
      _doubleTapResetTimer?.cancel();
      return;
    }
    final now = DateTime.now();
    if (_pendingDoubleTapPersonId == id &&
        _firstPointerDownTime != null &&
        now.difference(_firstPointerDownTime!) <
            const Duration(milliseconds: 400)) {
      _doubleTapResetTimer?.cancel();
      _pendingDoubleTapPersonId = null;
      _firstPointerDownTime = null;
      final person = snapshot.people.firstWhere((p) => p.id == id);
      showPersonMainDetailsDialog(context: context, person: person);
      return;
    }
    _pendingDoubleTapPersonId = id;
    _firstPointerDownTime = now;
    _doubleTapResetTimer?.cancel();
    _doubleTapResetTimer = Timer(const Duration(milliseconds: 450), () {
      _pendingDoubleTapPersonId = null;
      _firstPointerDownTime = null;
    });
  }

  void _handleCanvasTap(Offset localPosition, PedigreeSnapshot snapshot) {
    final world = _toWorld(localPosition);
    final hitPerson = hitTestPersonId(snapshot: snapshot, worldPos: world);
    if (hitPerson != null) {
      setState(() {
        _selectedPersonId = hitPerson;
        _selectedRelationshipId = null;
      });
      return;
    }

    final hitLine = hitTestPartnershipLineId(
      snapshot: snapshot,
      worldPos: world,
      scale: _scale,
    );
    if (hitLine != null) {
      setState(() {
        _selectedRelationshipId = hitLine;
        _selectedPersonId = null;
      });
      return;
    }

    setState(() {
      _selectedPersonId = null;
      _selectedRelationshipId = null;
    });
    context.read<PedigreeBloc>().add(
      PersonAddedRequested(
        centerX: world.dx,
        centerY: world.dy,
        sex: _newPersonSex,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final id = widget.pedigreeId;
      if (id == null) return;
      final bloc = context.read<PedigreeBloc>();
      if (bloc.state.activePedigreeId == id) {
        return;
      }
      bloc.add(PedigreeOpened(id));
    });
  }

  @override
  void dispose() {
    _doubleTapResetTimer?.cancel();
    super.dispose();
  }

  Future<void> _confirmDeletePerson() async {
    final id = _selectedPersonId;
    if (id == null) return;
    await waitUntilDialogGestureCleared();
    if (!mounted) return;
    // Snapshot can be briefly null between stream emissions; still show dialog.
    final snap = context.read<PedigreeBloc>().state.activeSnapshot;
    final descendantCount = snap?.countDescendantPersons(id) ?? 0;

    final DescendantsDeletionPolicy?
    choice = await showDialog<DescendantsDeletionPolicy>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (ctx) {
        if (descendantCount == 0) {
          return AlertDialog(
            title: const Text('Delete person?'),
            content: const Text(
              'This removes the person and any partnership lines they are part of.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, null),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () =>
                    Navigator.pop(ctx, DescendantsDeletionPolicy.retain),
                child: const Text('Delete'),
              ),
            ],
          );
        }
        return _DeletePersonScopeDialog(descendantCount: descendantCount);
      },
    );

    if (choice == null || !mounted) return;
    context.read<PedigreeBloc>().add(
      PersonDeleteRequested(id, descendantsPolicy: choice),
    );
    setState(() => _selectedPersonId = null);
  }

  Future<void> _confirmDetachRelationship() async {
    final id = _selectedRelationshipId;
    if (id == null) return;
    await waitUntilDialogGestureCleared();
    if (!mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      useRootNavigator: true,
      builder: (ctx) => AlertDialog(
        title: const Text('Detach partnership?'),
        content: const Text(
          'This removes the partnership line between the two parents. '
          'People stay on the canvas; children of this union remain linked unless you change them.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Detach'),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      context.read<PedigreeBloc>().add(RelationshipDeleteRequested(id));
      setState(() => _selectedRelationshipId = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<PedigreeBloc, PedigreeState>(
      builder: (context, state) {
        final snapshot = state.activeSnapshot;
        if (state.activePedigreeId == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Canvas')),
            body: Center(
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.pedigreeManager,
                    (route) => false,
                  );
                },
                child: const Text('Back to pedigrees'),
              ),
            ),
          );
        }

        if (snapshot == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Canvas')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(snapshot.meta.name),
            actions: [
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'F', label: Text('F')),
                  ButtonSegment(value: 'M', label: Text('M')),
                  ButtonSegment(value: 'U', label: Text('U')),
                ],
                selected: {_newPersonSex},
                onSelectionChanged: (s) {
                  setState(() => _newPersonSex = s.first);
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                tooltip: 'Detach selected partnership',
                onPressed: _selectedRelationshipId == null
                    ? null
                    : () => _confirmDetachRelationship(),
                icon: const Icon(Icons.link_off_outlined),
              ),
              IconButton(
                tooltip: 'Delete selected person',
                onPressed: _selectedPersonId == null
                    ? null
                    : () async => await _confirmDeletePerson(),
                icon: const Icon(Icons.person_remove_outlined),
              ),
              IconButton(
                tooltip: 'Back to pedigrees',
                onPressed: () {
                  Navigator.of(context).popUntil(
                    (r) =>
                        r.settings.name == AppRoutes.pedigreeManager ||
                        r.isFirst,
                  );
                },
                icon: const Icon(Icons.list),
              ),
            ],
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Listener(
                      onPointerDown: (e) {
                        _pointerDownLocal[e.pointer] = e.localPosition;
                        _onCanvasPointerDown(e, snapshot);
                      },
                      onPointerUp: (e) {
                        final start = _pointerDownLocal.remove(e.pointer);
                        if (start == null) return;
                        if ((e.localPosition - start).distance > kTouchSlop) {
                          return;
                        }
                        final now = DateTime.now();
                        final lastAt = _lastTapUpAt;
                        final lastPos = _lastTapUpLocal;
                        final isDoubleTap =
                            lastAt != null &&
                            lastPos != null &&
                            now.difference(lastAt) <
                                const Duration(milliseconds: 350) &&
                            (e.localPosition - lastPos).distance <
                                (kTouchSlop * 2);

                        if (isDoubleTap) {
                          _lastTapUpAt = null;
                          _lastTapUpLocal = null;
                          _handleCanvasTap(e.localPosition, snapshot);
                        } else {
                          _lastTapUpAt = now;
                          _lastTapUpLocal = e.localPosition;
                        }
                      },
                      onPointerCancel: (e) {
                        _pointerDownLocal.remove(e.pointer);
                      },
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onScaleStart: (d) {
                          final world = _toWorld(d.localFocalPoint);
                          _gestureStartScale = _scale;
                          _gestureStartFocalWorld = world;
                          if (d.pointerCount > 1) {
                            setState(() {
                              _lineFromPersonId = null;
                              _lineEndWorld = null;
                              _connectCandidatePersonId = null;
                              _connectDragStartWorld = null;
                              _dragPersonId = null;
                              _dragStartWorld = world;
                              _dragStartPersonCenter = null;
                              _didMove = false;
                              _lastWorldDuringDrag = world;
                            });
                            return;
                          }

                          final hitId = hitTestPersonId(
                            snapshot: snapshot,
                            worldPos: world,
                          );

                          if (_canvasTool == _CanvasTool.connect &&
                              hitId != null) {
                            setState(() {
                              _connectCandidatePersonId = hitId;
                              _connectDragStartWorld = world;
                              _lineEndWorld = world;
                              _selectedPersonId = hitId;
                              _dragPersonId = null;
                              _dragStartWorld = null;
                              _dragStartPersonCenter = null;
                              _didMove = false;
                              _lastWorldDuringDrag = world;
                            });
                            return;
                          }

                          if (_canvasTool == _CanvasTool.move &&
                              hitId != null) {
                            final person = snapshot.people.firstWhere(
                              (p) => p.id == hitId,
                            );
                            setState(() {
                              _selectedPersonId = hitId;
                              _dragPersonId = hitId;
                              _dragStartWorld = world;
                              _dragStartPersonCenter = Offset(
                                person.centerX,
                                person.centerY,
                              );
                              _didMove = false;
                              _lastWorldDuringDrag = world;
                              _connectCandidatePersonId = null;
                              _connectDragStartWorld = null;
                              _lineFromPersonId = null;
                              _lineEndWorld = null;
                            });
                            return;
                          }

                          setState(() {
                            _dragPersonId = null;
                            _connectCandidatePersonId = null;
                            _connectDragStartWorld = null;
                            _lineFromPersonId = null;
                            _lineEndWorld = null;
                            _dragStartWorld = world;
                            _didMove = false;
                            _lastWorldDuringDrag = world;
                          });
                        },
                        onScaleUpdate: (d) {
                          final world = _toWorld(d.localFocalPoint);
                          _lastWorldDuringDrag = world;

                          if (d.pointerCount > 1) {
                            if (_lineFromPersonId != null ||
                                _connectCandidatePersonId != null) {
                              setState(() {
                                _lineFromPersonId = null;
                                _lineEndWorld = null;
                                _connectCandidatePersonId = null;
                                _connectDragStartWorld = null;
                              });
                            }
                            if (_dragPersonId != null) {
                              setState(() {
                                _dragPersonId = null;
                                _dragStartWorld = null;
                                _dragStartPersonCenter = null;
                                _didMove = false;
                              });
                            }
                          }

                          if (_connectCandidatePersonId != null &&
                              _lineFromPersonId == null &&
                              _connectDragStartWorld != null &&
                              d.pointerCount == 1) {
                            if ((world - _connectDragStartWorld!).distance >
                                8) {
                              setState(() {
                                _lineFromPersonId = _connectCandidatePersonId;
                                _connectCandidatePersonId = null;
                                _lineEndWorld = world;
                              });
                              return;
                            }
                            return;
                          }

                          if (_lineFromPersonId != null &&
                              d.pointerCount == 1) {
                            setState(() => _lineEndWorld = world);
                            return;
                          }

                          if (_dragPersonId != null &&
                              _dragStartWorld != null &&
                              _dragStartPersonCenter != null) {
                            final delta = world - _dragStartWorld!;
                            if (delta.distance > 6) _didMove = true;
                            setState(() {});
                            return;
                          }

                          // One-finger panning (no scale change).
                          if (d.pointerCount == 1 && d.scale == 1.0) {
                            _pan += d.focalPointDelta;
                            setState(() {});
                            return;
                          }

                          // Pinch zoom (two+ pointers). Note: [ScaleUpdateDetails.scale]
                          // is relative to the start of the gesture, so use the stored
                          // start-scale to avoid compounding scale each update.
                          final startScale = _gestureStartScale ?? _scale;
                          final focalWorld = _gestureStartFocalWorld ?? world;

                          _scale = (startScale * d.scale).clamp(0.2, 10.0);

                          // Keep the original world focal point under the current finger.
                          _pan = d.localFocalPoint - (focalWorld * _scale);
                          setState(() {});
                        },
                        onScaleEnd: (d) {
                          _gestureStartScale = null;
                          _gestureStartFocalWorld = null;
                          final endWorld = _lastWorldDuringDrag;

                          if (_lineFromPersonId != null) {
                            final fromId = _lineFromPersonId!;
                            if (endWorld != null) {
                              final targetPerson = hitTestPersonId(
                                snapshot: snapshot,
                                worldPos: endWorld,
                              );
                              if (targetPerson != null &&
                                  targetPerson != fromId) {
                                context.read<PedigreeBloc>().add(
                                  RelationshipCreatedRequested(
                                    memberAId: fromId,
                                    memberBId: targetPerson,
                                  ),
                                );
                              } else {
                                final targetRel = hitTestRelationshipId(
                                  snapshot: snapshot,
                                  worldPos: endWorld,
                                );
                                if (targetRel != null) {
                                  context.read<PedigreeBloc>().add(
                                    OffspringAddedRequested(
                                      relationshipId: targetRel,
                                      childPersonId: fromId,
                                    ),
                                  );
                                }
                              }
                            }

                            setState(() {
                              _lineFromPersonId = null;
                              _lineEndWorld = null;
                              _connectCandidatePersonId = null;
                              _connectDragStartWorld = null;
                              _lastWorldDuringDrag = null;
                            });
                            return;
                          }

                          if (_connectCandidatePersonId != null) {
                            setState(() {
                              _connectCandidatePersonId = null;
                              _connectDragStartWorld = null;
                              _lastWorldDuringDrag = null;
                            });
                            return;
                          }

                          final dragId = _dragPersonId;
                          final startWorld = _dragStartWorld;
                          final startCenter = _dragStartPersonCenter;
                          if (dragId != null &&
                              startWorld != null &&
                              startCenter != null &&
                              _didMove &&
                              endWorld != null) {
                            final delta = endWorld - startWorld;
                            context.read<PedigreeBloc>().add(
                              PersonMovedRequested(
                                personId: dragId,
                                centerX: startCenter.dx + delta.dx,
                                centerY: startCenter.dy + delta.dy,
                              ),
                            );
                          }

                          setState(() {
                            _dragPersonId = null;
                            _dragStartWorld = null;
                            _dragStartPersonCenter = null;
                            _lastWorldDuringDrag = null;
                            _didMove = false;
                          });
                        },
                        child: ClipRect(
                          child: Transform(
                            transform: Matrix4.identity()
                              ..translateByDouble(_pan.dx, _pan.dy, 0, 1)
                              ..scaleByDouble(_scale, _scale, 1, 1),
                            child: CustomPaint(
                              size: Size(
                                constraints.maxWidth,
                                constraints.maxHeight,
                              ),
                              painter: PedigreePainter(
                                snapshot: _applyDragPreview(snapshot),
                                selectedPersonId: _selectedPersonId,
                                selectedRelationshipId: _selectedRelationshipId,
                                connectLineStart: _connectLineStart(snapshot),
                                connectLineEnd: _lineFromPersonId != null
                                    ? _lineEndWorld
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                right: 12,
                child: Card(
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        SegmentedButton<_CanvasTool>(
                          segments: const [
                            ButtonSegment(
                              value: _CanvasTool.connect,
                              label: Text('Connect'),
                              icon: Icon(Icons.timeline),
                            ),
                            ButtonSegment(
                              value: _CanvasTool.move,
                              label: Text('Move'),
                              icon: Icon(Icons.open_with),
                            ),
                          ],
                          selected: {_canvasTool},
                          onSelectionChanged: (s) {
                            setState(() {
                              _canvasTool = s.first;
                              _lineFromPersonId = null;
                              _lineEndWorld = null;
                              _connectCandidatePersonId = null;
                              _connectDragStartWorld = null;
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Connect: drag from a person to another person or to the union midpoint for a child. Move: drag symbols. Tap a relationship line (parents or to child): select union. Double-tap person: Main Details. Tap empty: add. Pinch: zoom.',
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Offset? _lastWorldDuringDrag;

  Offset? _connectLineStart(PedigreeSnapshot snapshot) {
    final id = _lineFromPersonId;
    if (id == null) return null;
    for (final p in snapshot.people) {
      if (p.id == id) return Offset(p.centerX, p.centerY);
    }
    return null;
  }

  /// Temporary snapshot with one person moved during drag (Move tool only).
  PedigreeSnapshot _applyDragPreview(PedigreeSnapshot snapshot) {
    if (_canvasTool != _CanvasTool.move) return snapshot;
    final dragId = _dragPersonId;
    final startWorld = _dragStartWorld;
    final startCenter = _dragStartPersonCenter;
    if (dragId == null || startWorld == null || startCenter == null) {
      return snapshot;
    }

    // If we haven't received a pan update yet, keep original.
    if (_lastWorldDuringDrag == null) return snapshot;

    final delta = _lastWorldDuringDrag! - startWorld;
    final movedPeople = snapshot.people
        .map((p) {
          if (p.id != dragId) return p;
          return p.copyWith(
            centerX: startCenter.dx + delta.dx,
            centerY: startCenter.dy + delta.dy,
          );
        })
        .toList(growable: false);

    return PedigreeSnapshot(
      pedigreeId: snapshot.pedigreeId,
      meta: snapshot.meta,
      people: movedPeople,
      relationships: snapshot.relationships,
      relationshipChildren: snapshot.relationshipChildren,
    );
  }
}

class _DeletePersonScopeDialog extends StatefulWidget {
  const _DeletePersonScopeDialog({required this.descendantCount});

  final int descendantCount;

  @override
  State<_DeletePersonScopeDialog> createState() =>
      _DeletePersonScopeDialogState();
}

class _DeletePersonScopeDialogState extends State<_DeletePersonScopeDialog> {
  DescendantsDeletionPolicy _policy = DescendantsDeletionPolicy.retain;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: const Text('Delete person?'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'This person has ${widget.descendantCount} descendant(s). '
              'Choose how they should be affected.',
            ),
            const SizedBox(height: 12),
            SegmentedButton<DescendantsDeletionPolicy>(
              segments: [
                const ButtonSegment(
                  value: DescendantsDeletionPolicy.retain,
                  label: Text('Keep descendants'),
                  icon: Icon(Icons.people_outline),
                ),
                ButtonSegment(
                  value: DescendantsDeletionPolicy.deleteRecursively,
                  label: const Text('Delete entire line'),
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
              selected: {_policy},
              onSelectionChanged: (s) {
                setState(() => _policy = s.first);
              },
            ),
            const SizedBox(height: 12),
            Text(
              _policy == DescendantsDeletionPolicy.retain
                  ? 'Only this person will be deleted. Descendants stay in the database and on the canvas.'
                  : 'This person and every descendant in their line will be deleted (multi-generation).',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, _policy),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
