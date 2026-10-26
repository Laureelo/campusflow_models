import 'package:campusflow_models/campusflow_models.dart';

void main() {
  final tache = Task(
    id: 1,
    title: 'Rendre le TP Dart',
    dueDate: DateTime(2026, 11, 1),
    courseId: 10,
  );
  final terminee = tache.copyWith(done: true);

  print(tache);
  print(terminee);
  print('En retard ? ${tache.enRetard(DateTime.now())}');
}
