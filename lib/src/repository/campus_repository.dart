import '../models/course.dart';
import '../models/task.dart';
import '../models/user.dart';

class CampusRepository {
  static const List<Map<String, dynamic>> _tasksJson = [
    {
      'id': 1,
      'title': 'Rendre le TP Dart',
      'dueDate': '2026-11-01T10:00:00',
      'done': false,
      'courseId': 10,
    },
    {
      'id': 2,
      'title': 'Réviser le cours de bases de données',
      'dueDate': '2026-10-20T08:00:00',
      'done': false,
      'courseId': 11,
    },
  ];

  static const List<Map<String, dynamic>> _coursesJson = [
    {'id': 10, 'name': 'Programmation mobile', 'teacher': 'M. Moctar'},
    {'id': 11, 'name': 'Bases de données', 'teacher': 'Mme Diallo'},
  ];

  static const Map<String, dynamic> _userJson = {
    'id': 1,
    'nom': 'Laure',
    'age': 23,
    'email': 'laure@campus.test',
  };

  Future<List<Task>> loadTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasksJson.map(Task.fromJson).toList();
  }

  Future<List<Course>> loadCourses() async {
    await Future.delayed(const Duration(seconds: 1));
    return _coursesJson.map(Course.fromJson).toList();
  }

  Future<User> loadUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return User.fromJson(_userJson);
  }
}
