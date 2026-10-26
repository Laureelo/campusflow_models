T champ<T>(Map<String, dynamic> json, String cle) {
  final valeur = json[cle];
  if (valeur == null) {
    throw FormatException('Champ manquant : "$cle"');
  }
  if (valeur is! T) {
    throw FormatException('Champ "$cle" de mauvais type (attendu : $T)');
  }
  return valeur;
}
