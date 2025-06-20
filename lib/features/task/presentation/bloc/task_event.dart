part of 'task_bloc.dart';

@immutable
sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskAdd extends TaskEvent {
  const TaskAdd({
    required this.task,
    required this.isToday,
  });

  final Task task;
  final bool isToday; // 1 today, 0 tomorrow,
}
