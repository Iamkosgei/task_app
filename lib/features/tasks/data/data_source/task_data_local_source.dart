import 'package:injectable/injectable.dart';
import 'package:taks_app/features/tasks/data/models/task_model.dart';

abstract class TaskDataLocalDataSource {
  List<TaskModel> getTasks();
  TaskModel addTask(TaskModel task);
  TaskModel editTask(TaskModel task);
  void toggleDone(int taskId);
}

@Injectable(as: TaskDataLocalDataSource)
class TaskDataLocalDataSourceImpl implements TaskDataLocalDataSource {
  final tasks = <TaskModel>[];
  @override
  TaskModel addTask(TaskModel task) {
    tasks.add(
      task.copyWith(
        id: tasks.length + 1,
        createdOn: DateTime.now(),
      ),
    );
    return task;
  }

  @override
  TaskModel editTask(TaskModel task) {
    final taskIndex = tasks.indexWhere((element) => element.id == task.id);
    if (taskIndex != -1) {
      final taskToUpdate = tasks[taskIndex].copyWith(name: task.name);

      tasks[taskIndex] = taskToUpdate;
    }
    //Normally you would throw
    return task;
  }

  @override
  List<TaskModel> getTasks() => tasks;

  @override
  void toggleDone(int taskId) {
    final taskIndex = tasks.indexWhere((element) => element.id == taskId);
    if (taskIndex != -1) {
      final isComplete = !(tasks[taskIndex].isComplete ?? false);

      tasks[taskIndex] = tasks[taskIndex].copyWith(
        isComplete: isComplete,
      );
    }
  }
}
