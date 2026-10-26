class Course {
  final int id;
  final String name;
  final String teacher;

  const Course({
    required this.id,
    required this.name,
    required this.teacher,
  });

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
