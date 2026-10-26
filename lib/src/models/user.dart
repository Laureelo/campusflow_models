import 'json_utils.dart';

class User {
  final int id;
  final String nom;
  final int age;
  final String email;

  const User({
    required this.id,
    required this.nom,
    required this.age,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: champ<int>(json, 'id'),
      nom: champ<String>(json, 'nom'),
      age: champ<int>(json, 'age'),
      email: champ<String>(json, 'email'),
    );
  }

  User copyWith({int? id, String? nom, int? age, String? email}) {
    return User(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'User(id: $id, nom: $nom, age: $age)';
}
