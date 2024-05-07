part of 'tasks_cubit.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TasksState {}

final class TaskLoaded extends TasksState {
  final List<Task> tasks;
  @override
  List<Object> get props => [tasks];

  const TaskLoaded(this.tasks);
}
