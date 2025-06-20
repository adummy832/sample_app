import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/features/task/presentation/bloc/task_bloc.dart';

class TaskListingWidget extends StatelessWidget {
  const TaskListingWidget({
    super.key,
    required this.title,
    required this.flag,
  });

  final String title;
  final int flag;

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
                context.go('/task-create');
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
            final list = taskBloc.states<TaskList>();

            // Guard clause
            if (list == null) return const SizedBox.shrink();

            return ListView.builder(
              itemCount: list.taskList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // Get the task object
                final task = list.taskList[index];

                // We need proper grouping of task
                // Can do this by 2d array?
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
