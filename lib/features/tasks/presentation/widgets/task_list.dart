import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taks_app/features/tasks/presentation/bloc/tasks_cubit/tasks_cubit.dart';
import 'package:taks_app/features/tasks/presentation/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        if (state is TaskLoaded) {
          return state.tasks.isEmpty
              ? const Center(
                  child: Text('No tasks, press + to add some task'),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      return TaskItem(
                        task: state.tasks[index],
                      );
                    },
                  ),
                );
        }
        return const SizedBox();
      },
    );
  }
}
