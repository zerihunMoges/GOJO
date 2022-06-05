import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), "token.db"),
        onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE Token (id INTEGER PRIMARY KEY, access TEXT, refresh TEXT');
    }, version: 1);
  }

  Future<dynamic> newToken(String access, String refresh) async {
    final db = await database;
    var value = {
      'id': 1,
      'access': access,
      'refresh': refresh,
    };
    final token = db.insert("Token", value);
    return 0;
  }

  Future<dynamic> getToken() async {
    final db = await database;

    var table = await db.query("Token");

    if (table.length == 0) {
      return null;
    }
    var tokenMap = table[0];
    return tokenMap.isNotEmpty ? tokenMap : Null;
  }
}



// 'access':
//           "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU1NjcwOTg0LCJpYXQiOjE2NTQzNzQ5ODQsImp0aSI6ImZhMWE4ODY1MDZkYTQ0ZWNhZjk4ZDQxNmMyYzZlZWI1IiwidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJoZW5vayIsImVtYWlsIjoiaGVub2tAZ21haWwuY29tIiwiZmlyc3RfbmFtZSI6IkRhZ2ltIiwibGFzdF9uYW1lIjoiTWF0aGVhcyJ9.Ui9dZSkyeJOs06t1Y6RtFOQsiJUvvjspgFYTu0ZXpTo",
//       'refresh':
//           'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY1Njk2Njk4NCwiaWF0IjoxNjU0Mzc0OTg0LCJqdGkiOiIzY2U2MWY5ZTNkMjU0YzE2YWVkNzczYmUzODZlOWJhZiIsInVzZXJfaWQiOjEsInVzZXJuYW1lIjoiaGVub2siLCJlbWFpbCI6Imhlbm9rQGdtYWlsLmNvbSIsImZpcnN0X25hbWUiOiJEYWdpbSIsImxhc3RfbmFtZSI6Ik1hdGhlYXMifQ.cXqc2Iy0Fu36Fl46kiKjX-wV3dlIxM-4VEdFZhmGae0'
    // 