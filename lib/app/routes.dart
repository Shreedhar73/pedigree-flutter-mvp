import 'package:flutter/widgets.dart';

class AppRoutes {
  static const pedigreeManager = '/';
  static const canvas = '/canvas';

  /// Pass [pedigreeId] as [RouteSettings.arguments] (int) when pushing canvas.
  static void openCanvas(BuildContext context, int pedigreeId) {
    Navigator.of(context).pushNamed(canvas, arguments: pedigreeId);
  }
}

