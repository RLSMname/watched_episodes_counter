import 'package:glorified_checkboxes/db/tables/anime_season_table.dart';
import 'package:glorified_checkboxes/db/tables/anime_table.dart';
import 'package:glorified_checkboxes/db/tables/filled_stamps_table.dart';
import 'package:glorified_checkboxes/db/tables/season_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._init();
  static final AppDatabase instance = AppDatabase._init();

  static Database? _db;
  static const String fileName = "watched_episodes_db.db";

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initializeDB(fileName);
    return _db!;
  }

  Future<Database> _initializeDB(String fileName) async {
    final dbDir = await getDatabasesPath();
    final dbPath = join(dbDir, fileName);
    return await openDatabase(dbPath,
        version: 1, onCreate: _onCreate, onOpen: _onOpen);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(AnimeTable.createSql);
    await db.execute(SeasonTable.createSql);
    await db.execute(AnimeSeasonTable.createSql);
    await db.execute(FilledStampsTable.createSql);
  }

  Future _onOpen(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> close() async {
    final db = await instance.database;
    return db.close();
  }
}
