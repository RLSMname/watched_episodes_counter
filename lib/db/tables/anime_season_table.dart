import 'package:glorified_checkboxes/db/tables/anime_table.dart';
import 'package:glorified_checkboxes/db/tables/season_table.dart';

class AnimeSeasonTable {
  static const String tableName = "animes_seasons";
  static const String animeIdField = "anime_id";
  static const String seasonIdField = "season_id";
  static const String createSql = '''
    CREATE TABLE $tableName(
      $animeIdField INTEGER NOT NULL,
      $seasonIdField INTEGER NOT NULL,
      FOREIGN KEY($animeIdField) REFERENCES ${AnimeTable.tableName}(${AnimeTable.idField}) ON DELETE CASCADE,
      FOREIGN KEY($seasonIdField) REFERENCES ${SeasonTable.tableName}(${SeasonTable.idField}) ON DELETE CASCADE,
      PRIMARY KEY($animeIdField, $seasonIdField)
    )
  ''';
}
