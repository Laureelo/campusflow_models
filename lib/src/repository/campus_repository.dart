import '../models/course.dart';
import '../models/task.dart';
import '../models/user.dart';

class CampusRepository {
  static const List<Map<String, dynamic>> _tasksJson = [
    {
      'id': 1,
      'title': 'Submit the Dart assignment',
      'dueDate': '2026-11-01T10:00:00',
      'done': false,
      'courseId': 10,
    },
    {
      'id': 2,
      'title': 'Review the database course',
      'dueDate': '2026-10-20T08:00:00',
      'done': false,
      'courseId': 11,
    },
  ];

  static const List<Map<String, dynamic>> _coursesJson = [
    {'id': 10, 'name': 'Mobile Programming', 'teacher': 'Mr. Moctar'},
    {'id': 11, 'name': 'Databases', 'teacher': 'Mrs. Diallo'},
  ];

  static const Map<String, dynamic> _userJson = {
    'id': 1,
    'name': 'Lila',
    'age': 23,
    'email': 'lila@campus.test',
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
