import 'package:glorified_checkboxes/db/tables/season_table.dart';

class FilledStampsTable {
  static const String tableName = "filled_stamps";
  static const String seasonIdField = "season_id";
  static const String stampNumberField = "stamp_number";
  static const String createSql = '''
  CREATE TABLE $tableName(
    $seasonIdField INTEGER NOT NULL,
    $stampNumberField INTEGER NOT NULL,
    FOREIGN KEY($seasonIdField) REFERENCES ${SeasonTable.tableName}(${SeasonTable.idField}) ON DELETE CASCADE,
    PRIMARY KEY($seasonIdField, $stampNumberField)
  )
  ''';
}
