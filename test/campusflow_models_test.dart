import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  group('models', () {
    test('copyWith changes one field and keeps the others', () {
      final task = Task(
        id: 1,
        title: 'Dart assignment',
        dueDate: DateTime(2026, 11, 1),
        courseId: 10,
      );

      final copy = task.copyWith(done: true);

      expect(copy.done, isTrue);
      expect(copy.title, 'Dart assignment');
      expect(task.done, isFalse);
    });

    test('fromJson builds a correct User', () {
      final user = User.fromJson({
        'id': 1,
        'name': 'Lila',
        'age': 23,
        'email': 'lila@campus.test',
      });

      expect(user.id, 1);
      expect(user.name, 'Lila');
      expect(user.age, 23);
      expect(user.email, 'lila@campus.test');
    });

    test('fromJson throws a FormatException when a field is missing', () {
      final incompleteJson = {'id': 1, 'name': 'Mobile Programming'};

      expect(() => Course.fromJson(incompleteJson), throwsFormatException);
    });
  });

  group('isOverdue', () {
    final now = DateTime(2026, 10, 26);

    test('is true when the due date has passed and the task is not done', () {
      final task = Task(
        id: 1,
        title: 'Late task',
        dueDate: DateTime(2026, 10, 20),
        courseId: 10,
      );

      expect(task.isOverdue(now), isTrue);
    });

    test('is false when the task is done, even if the date has passed', () {
      final task = Task(
        id: 1,
        title: 'Finished task',
        dueDate: DateTime(2026, 10, 20),
        done: true,
        courseId: 10,
      );

      expect(task.isOverdue(now), isFalse);
    });

    test('is false when the due date is in the future', () {
      final task = Task(
        id: 1,
        title: 'Future task',
        dueDate: DateTime(2026, 11, 1),
        courseId: 10,
      );

      expect(task.isOverdue(now), isFalse);
    });
  });

  group('CampusRepository', () {
    final repository = CampusRepository();

    test('loadTasks returns the tasks built from the JSON data', () async {
      final tasks = await repository.loadTasks();

      expect(tasks, hasLength(2));
      expect(tasks.first.title, 'Submit the Dart assignment');
    });

    test('loadCourses returns the courses built from the JSON data', () async {
      final courses = await repository.loadCourses();

      expect(courses, hasLength(2));
      expect(courses.first.name, 'Mobile Programming');
    });

    test('loadUser returns the user built from the JSON data', () async {
      final user = await repository.loadUser();

      expect(user.name, 'Lila');
    });

    test('three loads in parallel take about 1 second, not 3', () async {
      final stopwatch = Stopwatch()..start();

      await (
        repository.loadUser(),
        repository.loadCourses(),
        repository.loadTasks(),
      ).wait;

      expect(stopwatch.elapsed, lessThan(const Duration(milliseconds: 2000)));
    });
  });
}
