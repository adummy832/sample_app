part of 'task_bloc.dart';

@immutable
sealed class TaskState extends Equatable {
  const TaskState();

  List<Task> get taskList;

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {
  @override
  List<Task> get taskList => throw UnimplementedError();
}

class TaskToday extends TaskState {
  const TaskToday({this.taskList = const []});

  @override
  final List<Task> taskList;

  @override
  List<Object> get props => [taskList];
}

class TaskTomorrow extends TaskState {
  const TaskTomorrow({this.taskList = const []});

  @override
  final List<Task> taskList;

  @override
  List<Object> get props => [taskList];
}
