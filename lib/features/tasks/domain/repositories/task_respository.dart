import 'package:taks_app/features/tasks/domain/entities/task.dart';

abstract class TaskRepository {
  List<Task> getTasks();
  Task addTask(Task task);
  Task editTask(Task task);
  void toggleDone(int taskId);
}
