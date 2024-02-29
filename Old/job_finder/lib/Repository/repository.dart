import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../Helper/constants.dart';
import 'db_connection.dart';

class Repository {
  late DatabaseConnection _connection;

  Repository() {
    _connection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _connection.setDatabase();

    return _database;
  }

  httpGet(String api) async {
    return await http.get(Uri.https(Constant.baseUrl, "${Constant.subUrl}/$api"));
  }

  httpGetById(String api, id) async {
    return await http.get(Uri.https(Constant.baseUrl, "${Constant.subUrl}/$api/$id"));
  }

  httpPost(String api, data) async {
    print(data);
    return await http.post(Uri.parse("https://${Constant.baseUrl}/${Constant.subUrl}/$api"),
        body: data);
  }
}
