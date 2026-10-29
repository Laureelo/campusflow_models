import 'json_utils.dart';

class User {
  final int id;
  final String name;
  final int age;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: readField<int>(json, 'id'),
      name: readField<String>(json, 'name'),
      age: readField<int>(json, 'age'),
      email: readField<String>(json, 'email'),
    );
  }

  User copyWith({int? id, String? name, int? age, String? email}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'User(id: $id, name: $name, age: $age)';
}
