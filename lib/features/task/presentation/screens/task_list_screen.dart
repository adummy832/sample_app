import 'package:flutter/material.dart';
import 'package:sample_app/features/task/presentation/widgets/task_listing_widget.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Test app'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TaskListingWidget(
              title: 'Today',
              isToday: true, // today,
            ),
            TaskListingWidget(
              title: 'Tomorrow',
              isToday: false,
            ),
          ],
        ),
      ),
    );
  }
}
