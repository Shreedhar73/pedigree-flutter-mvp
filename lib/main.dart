import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/di/get_it.dart';
import 'app/routes.dart';
import 'presentation/bloc/pedigree_bloc.dart';
import 'presentation/canvas/canvas_screen.dart';
import 'presentation/pedigree_manager/pedigree_manager_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const ProbandApp());
}

class ProbandApp extends StatelessWidget {
  const ProbandApp({super.key, this.pedigreeBloc});

  final PedigreeBloc? pedigreeBloc;

  @override
  Widget build(BuildContext context) {
    final bloc = pedigreeBloc ?? getIt<PedigreeBloc>();

    return BlocProvider<PedigreeBloc>.value(
      value: bloc,
      child: MaterialApp(
        title: 'Proband',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
      ),
        initialRoute: AppRoutes.pedigreeManager,
        routes: {
          AppRoutes.pedigreeManager: (_) => const PedigreeManagerScreen(),
          AppRoutes.canvas: (context) {
            final args = ModalRoute.of(context)?.settings.arguments;
            final pedigreeId = args is int ? args : null;
            return CanvasScreen(pedigreeId: pedigreeId);
          },
        },
      ),
    );
  }
}
