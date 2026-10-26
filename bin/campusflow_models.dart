import 'package:campusflow_models/campusflow_models.dart';

Future<void> main() async {
  final depot = CampusRepository();

  print('Chargement en cours...');
  final user = await depot.loadUser();
  final cours = await depot.loadCourses();
  final taches = await depot.loadTasks();

  print(user);
  cours.forEach(print);
  for (final t in taches) {
    print('$t -> en retard ? ${t.enRetard(DateTime(2026, 10, 26))}');
  }

  print(taches.first.copyWith(done: true));
}
