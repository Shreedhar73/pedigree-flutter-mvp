import 'dart:async';

import 'package:flutter/widgets.dart';

/// Call this **before** [showDialog] when opening from a button/tap handler.
///
/// Defers until after the next frame plus a tiny delay so the opening tap’s
/// pointer sequence does not interact with the new dialog. Prefer [State]
/// context (not [BlocBuilder] / item [BuildContext]) after any `await`, or
/// `mounted` can go false and [showDialog] never runs.
Future<void> waitUntilDialogGestureCleared() async {
  // One frame is occasionally not enough; the opening pointer-up can still land
  // on the dialog barrier and dismiss it. Two frames + a short delay is much
  // more reliable across platforms.
  await _afterFrame();
  await _afterFrame();
  await Future<void>.delayed(const Duration(milliseconds: 48));
}

Future<void> _afterFrame() {
  final c = Completer<void>();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!c.isCompleted) c.complete();
  });
  return c.future;
}
