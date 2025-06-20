part of 'task_bloc.dart';

@immutable
sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskList extends TaskState {
  const TaskList({
    this.taskList = const [],
  });

  final List<Task> taskList;

  @override
  List<Object> get props => [
        taskList,
      ];
}
