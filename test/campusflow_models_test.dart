import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  test('copyWith change un champ et garde les autres', () {
    final tache = Task(
      id: 1,
      title: 'TP Dart',
      dueDate: DateTime(2026, 11, 1),
      courseId: 10,
    );

    final copie = tache.copyWith(done: true);

    expect(copie.done, isTrue);
    expect(copie.title, 'TP Dart');
    expect(tache.done, isFalse);
  });

  test('fromJson construit un User correct', () {
    final user = User.fromJson({
      'id': 1,
      'nom': 'Laure',
      'age': 23,
      'email': 'laure@campus.test',
    });

    expect(user.id, 1);
    expect(user.nom, 'Laure');
    expect(user.age, 23);
    expect(user.email, 'laure@campus.test');
  });

  test('fromJson lance une FormatException si un champ manque', () {
    final jsonIncomplet = {'id': 1, 'name': 'Programmation mobile'};

    expect(() => Course.fromJson(jsonIncomplet), throwsFormatException);
  });
}
