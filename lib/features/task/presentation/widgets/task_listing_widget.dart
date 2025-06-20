// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/features/task/presentation/bloc/task_bloc.dart';

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
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
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
                final task = mState.taskList[index];

                return ListTile(
                  leading: const Text('X'), // TODO
                  title: Text(task.name ?? ''),
                  trailing: Text(task.time ?? ''),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
