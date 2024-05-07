import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taks_app/features/tasks/domain/entities/task.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    int? id,
    String? name,
    DateTime? createdOn,
    bool? isComplete,
  }) = _TaskModel;

  TaskModel._();

  Task toDomain() {
    return Task(
      id: id,
      name: name,
      createdOn: createdOn,
      isComplete: isComplete,
    );
  }

  static TaskModel fromDomain(Task task) {
    return TaskModel(
      createdOn: task.createdOn,
      id: task.id,
      name: task.name,
      isComplete: task.isComplete,
    );
  }
}
