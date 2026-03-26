import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/routes.dart';
import '../bloc/pedigree_bloc.dart';
import '../utils/dialog_gesture_guard.dart';

class PedigreeManagerScreen extends StatefulWidget {
  const PedigreeManagerScreen({super.key});

  @override
  State<PedigreeManagerScreen> createState() => _PedigreeManagerScreenState();
}

class _PedigreeManagerScreenState extends State<PedigreeManagerScreen> {
  Future<void> _confirmDeletePedigree(int pedId) async {
    await waitUntilDialogGestureCleared();
    if (!mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      useRootNavigator: true,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete pedigree?'),
        content: Text(
          'This will permanently remove pedigree $pedId and all people in it.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      context.read<PedigreeBloc>().add(PedigreeDeleteRequested(pedId));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<PedigreeBloc>().add(const PedigreesWatchRequested());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedigrees'),
        backgroundColor: theme.colorScheme.surface,
      ),
      body: BlocConsumer<PedigreeBloc, PedigreeState>(
        listenWhen: (prev, next) =>
            prev.activePedigreeId != next.activePedigreeId &&
            next.activePedigreeId != null,
        listener: (context, state) {
          final id = state.activePedigreeId;
          if (id == null) return;
          if (!context.mounted) return;
          if (Navigator.of(context).canPop()) {
            return;
          }
          AppRoutes.openCanvas(context, id);
        },
        builder: (context, state) {
          if (state.pedigrees.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('No pedigrees yet', style: theme.textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(
                      'Create your first pedigree to start drawing.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: () {
                        context.read<PedigreeBloc>().add(
                          const PedigreeCreatedRequested(),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Create pedigree'),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final ped = state.pedigrees[index];
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: theme.colorScheme.surfaceContainerHighest,
                title: Text('Pedigree ${ped.id}'),
                subtitle: ped.createdAt == null
                    ? null
                    : Text(
                        DateTime.fromMillisecondsSinceEpoch(
                          ped.createdAt!,
                        ).toLocal().toString(),
                      ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'Delete pedigree',
                      icon: Icon(
                        Icons.delete_outline,
                        color: theme.colorScheme.error,
                      ),
                      onPressed: () => _confirmDeletePedigree(ped.id),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () => AppRoutes.openCanvas(context, ped.id),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemCount: state.pedigrees.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<PedigreeBloc>().add(const PedigreeCreatedRequested());
        },
        icon: const Icon(Icons.add),
        label: const Text('New'),
      ),
    );
  }
}
