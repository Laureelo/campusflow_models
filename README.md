# campusflow_models

CampusFlow data models in pure Dart (90-minute workshop).

## Contents

- `Task`, `Course` and `User`: `final` fields, constructor, `copyWith` and `fromJson`.
- `Task.isOverdue`: true when the due date has passed and the task is not done.
- `CampusRepository`: simulated repository that loads JSON data with `Future.delayed`.
- Parallel loading of the user, the courses and the tasks with `Future.wait` (records `.wait`).
- Tests: `copyWith`, `fromJson`, expected error (`FormatException`), `isOverdue` and the repository.

## Structure

```
lib/src/models/          the three models and readField (JSON reading)
lib/src/repository/      the simulated repository
bin/                     demo program
test/                    tests
```

## Run

```
dart pub get
dart run
dart test
```
