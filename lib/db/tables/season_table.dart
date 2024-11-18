class SeasonTable {
  static const String tableName = "seasons";
  static const String idField = "id";
  static const String numberField = "season_number";
  static const String totalEpsField = "total_eps_number";
  static const String createSql = '''
      CREATE TABLE $tableName(
        $idField INTEGER PRIMARY KEY AUTOINCREMENT,
        $numberField INTEGER NOT NULL,
        $totalEpsField INTGER NOT NULL
      )
  ''';
}
