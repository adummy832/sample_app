// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_state_bloc/multi_state_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/features/task/domain/entities/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends MultiStateBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskAdd>(_taskAdd);
  }

  void _taskAdd(
    TaskAdd event,
    Emitter<TaskState> state,
  ) async {
    final task = event.task;
    final isToday = event.isToday;

    // Get the current state based on isToday
    final currentState = isToday ? states<TaskToday>() : states<TaskTomorrow>();

    // Create updated task list
    final updatedTasks = [
      ...?currentState?.taskList,
      task,
    ];

    // Emit the appropriate state
    emit(
      isToday
          ? TaskToday(taskList: updatedTasks)
          : TaskTomorrow(taskList: updatedTasks),
    );
  }
}
