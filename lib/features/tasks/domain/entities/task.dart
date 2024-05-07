import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    int? id,
    String? name,
    DateTime? createdOn,
    bool? isComplete,
  }) = _Task;
}
