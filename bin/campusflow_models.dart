import 'package:campusflow_models/campusflow_models.dart';

Future<void> main() async {
  final repository = CampusRepository();

  print('Loading...');
  final stopwatch = Stopwatch()..start();
  final (user, courses, tasks) = await (
    repository.loadUser(),
    repository.loadCourses(),
    repository.loadTasks(),
  ).wait;
  stopwatch.stop();
  print('Loaded in ${stopwatch.elapsedMilliseconds} ms');

  print(user);
  courses.forEach(print);
  for (final task in tasks) {
    print('$task -> overdue? ${task.isOverdue(DateTime(2026, 10, 26))}');
  }

  print(tasks.first.copyWith(done: true));
}
