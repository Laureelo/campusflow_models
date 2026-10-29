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
      id: readField<int>(json, 'id'),
      title: readField<String>(json, 'title'),
      dueDate: DateTime.parse(readField<String>(json, 'dueDate')),
      done: json['done'] as bool? ?? false,
      courseId: readField<int>(json, 'courseId'),
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

  bool isOverdue(DateTime now) {
    return dueDate.isBefore(now) && !done;
  }

  @override
  String toString() => 'Task(id: $id, title: $title, done: $done)';
}
