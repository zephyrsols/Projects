import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

import '../Models/favorite.dart';

class DBHelper {
  // ignore: non_constant_identifier_names
  static final String CREATE_TABLE_FAVORITE = '''CREATE TABLE $TABLE_FAVORITE(
  $COLUMN_ID          INTEGER PRIMARY KEY AUTOINCREMENT,
  $COLUMN_JOB_POST_ID   INTEGER,
  $COLUMN_IS_FAVORITE INTEGER,
  $COLUMN_COMPANY_NAME       TEXT,
  $COLUMN_COMPANY_LOCATION TEXT,
  $COLUMN_JOB_TITLE  TEXT,
  $COLUMN_JOB_DESCRIPTION    TEXT,
  $COLUMN_CATEGORY    TEXT,
  $COLUMN_POSITION    TEXT,
  $COLUMN_SALARY_RANGE    TEXT,
  $COLUMN_DOCUMENTATION    TEXT,
  $COLUMN_COMPANY_LOGO       TEXT,
  $COLUMN_DATE       TEXT,
  $COLUMN_JOB_TYPE TEXT
  )''';

  static Future<Database> open() async {
    // ignore: non_constant_identifier_names
    final BASEPATH = await getDatabasesPath();
    // ignore: non_constant_identifier_names
    final DBPATH = Path.join(BASEPATH, 'job2.db');
    return openDatabase(DBPATH, version: 2, onCreate: (db, version) async {
      await db.execute(CREATE_TABLE_FAVORITE);
    });
  }

  // ignore: missing_return, body_might_complete_normally_nullable
  static Future<int?> insert(Favorite favorite) async {
    final db = await open();
    getSingle(favorite.jobPostId!).then((value) {
      if (value != null) {
        return db.delete(TABLE_FAVORITE,
            where: '$COLUMN_JOB_POST_ID=?', whereArgs: [favorite.jobPostId]);
      } else {
        return db.insert(TABLE_FAVORITE, favorite.toJson());
      }
    });
  }

  static Future<Favorite?> getSingle(int? jobPostId) async {
    final db = await open();
    List<Map<String, dynamic>> mapList = await db.query(TABLE_FAVORITE,
        where: '$COLUMN_JOB_POST_ID=?', whereArgs: [jobPostId], limit: 1);
    if (mapList.length > 0) {
      return Favorite.fromJson(mapList.first);
    } else {
      return null;
    }
  }

  static Future<List<Favorite>?> getAll() async {
    final db = await open();
    List<Map<String, dynamic>> mapList = await db.query(TABLE_FAVORITE);
    if (mapList.length > 0) {
      return List.generate(
          mapList.length, (index) => Favorite.fromJson(mapList[index]));
    } else {
      return null;
    }
  }
}
