import 'package:e_quran/model/bookmark_surah_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database;
  }

  final String _tableName = 'table_surah';

  Future<Database> _initializeDB() async {
    var db = openDatabase(
      join(
        await getDatabasesPath(),
         'surah_db.db',
         ),
        onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE $_tableName(nomor INTEGER PRIMARY KEY, namaLatin TEXT, jumlahAyat TEXT)'''
          );
    }, version: 1);

    return db;
  }

  Future<List<BookmarkTable>> getListSurahBookmark() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results
        .map(
          (e) => BookmarkTable.fromMap(e),
        )
        .toList();
  }

  Future<void> insertBookmark(BookmarkTable bookmarkTable) async {
    final db = await database;

    await db.insert(
      _tableName, 
      bookmarkTable.toMap(),
    );
  }

  Future<int> removeBookmark(int nomor) async {
    final db = await database;

    return await db.delete(_tableName, where: 'nomor = ?', whereArgs: [nomor]);
  }

  Future<BookmarkTable> getStatusBookmark(int nomor) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: "nomor = ?",
      whereArgs: [nomor],
    );

    return results
        .map(
          (e) => BookmarkTable.fromMap(e),
        )
        .first;
  }
}
