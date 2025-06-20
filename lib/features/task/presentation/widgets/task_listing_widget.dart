// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/features/task/domain/entities/task.dart';
import 'package:sample_app/features/task/presentation/bloc/task_bloc.dart';
import 'package:sample_app/features/task/presentation/widgets/upgraded_list_tile.dart';

class TaskListingWidget extends StatelessWidget {
  const TaskListingWidget({
    super.key,
    required this.title,
    required this.isToday,
  });

  final String title;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            ElevatedButton(
              onPressed: () {
                context.go('/task-create/$isToday');
              },
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              child: const Icon(Icons.add),
            )
          ],
        ),
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            // Get the state list
            var mState;
            if (isToday) {
              mState = taskBloc.states<TaskToday>();
            } else {
              mState = taskBloc.states<TaskTomorrow>();
            }

            // Guard clause
            if (mState == null) return const SizedBox.shrink();

            return ListView.builder(
              itemCount: mState.taskList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // Get the task object
                final task = mState.taskList[index] as Task;

                return UpgradedListTile(
                  leadingBuilder: (value) {
                    return Checkbox(
                      checkColor: Colors.white,
                      value: value,
                      onChanged: null,
                    );
                  },
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.name),
                      if (task.notes == null) ...[
                        const SizedBox.shrink()
                      ] else ...[
                        Text(
                          'Note: ${task.notes!}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ]
                    ],
                  ),
                  trailing: Text(task.time),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
