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
    final today = event.isToday;

    // Determine if today or tomorrow.
    var mState;
    if (today) {
      mState = states<TaskToday>();
    } else {
      mState = states<TaskTomorrow>();
    }

    final oldTasks = mState?.taskList;
    final List<Task> updatedTasks = [
      ...?oldTasks,
      task,
    ];

    if (today) {
      emit(TaskToday(taskList: updatedTasks));
    } else {
      emit(TaskTomorrow(taskList: updatedTasks));
    }
  }
}
