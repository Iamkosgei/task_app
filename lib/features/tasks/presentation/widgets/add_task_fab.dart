import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taks_app/core/ui/app_colors.dart';
import 'package:taks_app/features/tasks/presentation/bloc/tasks_cubit/tasks_cubit.dart';
import 'package:taks_app/features/tasks/presentation/widgets/add_edit_task.dart';

class AddTaskFAB extends StatelessWidget {
  const AddTaskFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: fabColor,
      foregroundColor: Colors.white,
      onPressed: () {
        final tasksCubit = context.read<TasksCubit>();

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => BlocProvider.value(
            value: tasksCubit,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddEditTask(
                task: null,
              ),
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
