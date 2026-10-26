import 'json_utils.dart';

class Course {
  final int id;
  final String name;
  final String teacher;

  const Course({
    required this.id,
    required this.name,
    required this.teacher,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: champ<int>(json, 'id'),
      name: champ<String>(json, 'name'),
      teacher: champ<String>(json, 'teacher'),
    );
  }

  Course copyWith({int? id, String? name, String? teacher}) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      teacher: teacher ?? this.teacher,
    );
  }

  @override
  String toString() => 'Course(id: $id, name: $name, teacher: $teacher)';
}
