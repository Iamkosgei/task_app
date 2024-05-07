import 'package:injectable/injectable.dart';
import 'package:taks_app/features/tasks/data/data_source/task_data_local_source.dart';
import 'package:taks_app/features/tasks/data/models/task_model.dart';
import 'package:taks_app/features/tasks/domain/entities/task.dart';
import 'package:taks_app/features/tasks/domain/repositories/task_respository.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskDataLocalDataSource taskDataLocalDataSource;

  TaskRepositoryImpl({required this.taskDataLocalDataSource});
  @override
  Task addTask(Task task) {
    return taskDataLocalDataSource
        .addTask(TaskModel.fromDomain(task))
        .toDomain();
  }

  @override
  Task editTask(Task task) {
    return taskDataLocalDataSource
        .editTask(
          TaskModel.fromDomain(task),
        )
        .toDomain();
  }

  @override
  List<Task> getTasks() {
    final tasks = taskDataLocalDataSource.getTasks();
    return tasks.map((e) => e.toDomain()).toList();
  }

  @override
  void toggleDone(int taskId) {
    return taskDataLocalDataSource.toggleDone(taskId);
  }
}
