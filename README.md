# campusflow_models

Modèles de données de CampusFlow en Dart pur (atelier de 90 minutes).

## Contenu

- `Task`, `Course` et `User` : attributs `final`, constructeur, `copyWith` et `fromJson`.
- `CampusRepository` : dépôt simulé qui charge des données JSON avec `Future.delayed`.
- 3 tests : `copyWith`, `fromJson` et erreur attendue (`FormatException`).

## Structure

```
lib/src/models/          les trois modèles et la fonction champ (lecture du JSON)
lib/src/repository/      le dépôt simulé
bin/                     programme de démonstration
test/                    les tests
```

## Lancer le projet

```
dart pub get
dart run
dart test
```
