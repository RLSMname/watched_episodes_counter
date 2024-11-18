class AnimeTable {
  static const String tableName = "animes";
  static const String idField = "id";
  static const String nameField = "name";
  static const String createSql = '''
      CREATE TABLE $tableName(
       $idField INTEGER PRIMARY KEY AUTOINCREMENT,
       $nameField TEXT NOT NULL
      )
  ''';
}
