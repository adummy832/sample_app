class Task {
  final String name;
  final String time;
  final String? notes;
  final String? attachement;

  Task({
    required this.name,
    required this.time,
    this.notes,
    this.attachement,
  });
}
