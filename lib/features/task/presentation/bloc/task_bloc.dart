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

    // Get the old data task ref.
    final oldList = states<TaskList>();

    // First run empty

    // Can do refactoring later. This is a bit ugly
    if (oldList?.taskList == null) {
      final tmp = {
        'today': [],
        'tomorrow': [],
      };

      final List<Task> newList = [
        ...tmp,
        task,
      ];

      emit(TaskList(taskList: newList));
    } else {
      final old = oldList?.taskList;
      emit(TaskList(taskList: [...old!, task]));
    }
  }
}
