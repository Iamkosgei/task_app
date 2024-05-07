import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taks_app/core/ui/app_colors.dart';
import 'package:taks_app/features/tasks/domain/entities/task.dart';
import 'package:taks_app/features/tasks/presentation/bloc/tasks_cubit/tasks_cubit.dart';
import 'package:taks_app/features/tasks/presentation/widgets/add_edit_task.dart';
import 'package:taks_app/features/tasks/presentation/widgets/custom_radio.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: Colors.white,
        child: ListTile(
            leading: CustomRadio(
              onTap: () {
                context.read<TasksCubit>().markTaskAsDone(task.id);
              },
              isComplete: task.isComplete ?? false,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                task.name ?? '',
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: task.isComplete == true
                          ? disabledTextColor
                          : primaryTextColor,
                      decoration: task.isComplete == true
                          ? TextDecoration.lineThrough
                          : null,
                    ),
              ),
            ),
            trailing: OutlinedButton(
              onPressed: () {
                final tasksCubit = context.read<TasksCubit>();

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => BlocProvider.value(
                    value: tasksCubit,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddEditTask(
                        task: task,
                      ),
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  primaryTextColor,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: primaryTextColor,
                  ),
                ),
              ),
              child: const Text("Edit"),
            )),
      ),
    );
  }
}
