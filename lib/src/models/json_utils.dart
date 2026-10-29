T readField<T>(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value == null) {
    throw FormatException('Missing field: "$key"');
  }
  if (value is! T) {
    throw FormatException('Field "$key" has the wrong type (expected: $T)');
  }
  return value;
}
