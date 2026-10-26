import 'json_utils.dart';

class Task {
  final int id;
  final String title;
  final DateTime dueDate;
  final bool done;
  final int courseId;

  const Task({
    required this.id,
    required this.title,
    required this.dueDate,
    this.done = false,
    required this.courseId,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: champ<int>(json, 'id'),
      title: champ<String>(json, 'title'),
      dueDate: DateTime.parse(champ<String>(json, 'dueDate')),
      done: json['done'] as bool? ?? false,
      courseId: champ<int>(json, 'courseId'),
    );
  }

  Task copyWith({
    int? id,
    String? title,
    DateTime? dueDate,
    bool? done,
    int? courseId,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      done: done ?? this.done,
      courseId: courseId ?? this.courseId,
    );
  }

  bool enRetard(DateTime maintenant) {
    return dueDate.isBefore(maintenant) && !done;
  }

  @override
  String toString() => 'Task(id: $id, title: $title, done: $done)';
}
