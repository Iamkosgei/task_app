import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_app/features/tasks/domain/entities/task.dart';
import 'package:taks_app/features/tasks/domain/repositories/task_respository.dart';

part 'tasks_state.dart';

@injectable
class TasksCubit extends Cubit<TasksState> {
  final TaskRepository taskRepository;

  TasksCubit(this.taskRepository) : super(TaskInitial());

  void addTask(Task task) async {
    taskRepository.addTask(task);
    loadTasks();
  }

  void loadTasks() async {
    final tasks = taskRepository.getTasks();
    log(tasks.toString());
    emit(TaskLoaded(tasks));
  }

  void updateTask(Task task) async {
    taskRepository.editTask(task);
    loadTasks();
  }

  void markTaskAsDone(int? taskId) async {
    if (taskId == null) return;
    log('$taskId');
    taskRepository.toggleDone(taskId);
    loadTasks();
  }
}
