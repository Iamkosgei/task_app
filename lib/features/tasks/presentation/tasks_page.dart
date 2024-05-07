import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taks_app/core/di/injection.dart';
import 'package:taks_app/features/tasks/presentation/bloc/tasks_cubit/tasks_cubit.dart';
import 'package:taks_app/features/tasks/presentation/widgets/add_task_fab.dart';
import 'package:taks_app/features/tasks/presentation/widgets/ads.dart';
import 'package:taks_app/features/tasks/presentation/widgets/greetings.dart';
import 'package:taks_app/features/tasks/presentation/widgets/task_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TasksCubit>()..loadTasks(),
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Greetings(),
              Ads(),
              SizedBox(
                height: 16,
              ),
              TaskList(),
            ],
          ),
        ),
        floatingActionButton: AddTaskFAB(),
      ),
    );
  }
}
