import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taks_app/core/ui/app_colors.dart';
import 'package:taks_app/features/tasks/domain/entities/task.dart';
import 'package:taks_app/features/tasks/presentation/bloc/tasks_cubit/tasks_cubit.dart';

class AddEditTask extends StatefulWidget {
  final Task? task;
  const AddEditTask({super.key, required this.task});

  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> {
  final formKey = GlobalKey<FormState>();

  String taskName = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 62,
                width: double.infinity,
                color: primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Text(
                      widget.task == null ? 'Add New Task' : 'Edit Task',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 24,
                          ),
                    ),
                    const SizedBox()
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Name',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      initialValue: widget.task?.name,
                      onSaved: (newValue) {
                        taskName = newValue ?? '';
                      },
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(const Size(
                            double.infinity,
                            61,
                          ))),
                      onPressed: () {
                        formKey.currentState?.save();
                        late Task task;

                        if (widget.task == null) {
                          task = Task(
                            name: taskName,
                          );
                          context.read<TasksCubit>().addTask(task);
                        } else {
                          task = widget.task!.copyWith(
                            name: taskName,
                          );
                          context.read<TasksCubit>().updateTask(task);
                        }

                        Navigator.pop(context);
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
