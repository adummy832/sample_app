class TaskModel {
  String? _name;
  String? _time;
  String? _notes;
  String? _attachement;

  Task({
    String? name,
    String? time,
    String? notes,
    String? attachement,
  }) {
    if (name != null) {
      this._name = name;
    }
    if (time != null) {
      this._time = time;
    }
    if (notes != null) {
      this._notes = notes;
    }
    if (attachement != null) {
      this._attachement = attachement;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get time => _time;
  set time(String? time) => _time = time;
  String? get notes => _notes;
  set notes(String? notes) => _notes = notes;
  String? get attachement => _attachement;
  set attachement(String? attachement) => _attachement = attachement;

  TaskModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _time = json['time'];
    _notes = json['notes'];
    _attachement = json['attachement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['time'] = _time;
    data['notes'] = _notes;
    data['attachement'] = _attachement;
    return data;
  }
}
