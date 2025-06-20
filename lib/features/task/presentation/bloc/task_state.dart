part of 'task_bloc.dart';

@immutable
sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskToday extends TaskState {
  const TaskToday({this.taskList = const []});

  final List<Task> taskList;

  @override
  List<Object> get props => [taskList];
}

class TaskTomorrow extends TaskState {
  const TaskTomorrow({this.taskList = const []});

  final List<Task> taskList;

  @override
  List<Object> get props => [taskList];
}
