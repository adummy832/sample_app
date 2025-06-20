class TaskModel {
  final String name;
  final String time;
  final String? notes;
  final String? attachement;

  TaskModel({
    required this.name,
    required this.time,
    this.notes,
    this.attachement,
  });

  TaskModel copyWith({
    String? name,
    String? time,
    String? notes,
    String? attachement,
  }) {
    return TaskModel(
      name: name ?? this.name,
      time: time ?? this.time,
      notes: notes ?? this.notes,
      attachement: attachement ?? this.attachement,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json["name"],
      time: json["time"],
      notes: json["notes"],
      attachement: json["attachement"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
        "notes": notes,
        "attachement": attachement,
      };
}
