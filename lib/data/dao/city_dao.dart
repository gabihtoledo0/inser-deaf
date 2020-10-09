import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/database-helper.dart';
import 'package:Inserdeaf/models/city.dart';
import 'dart:convert';

class CityDao {
  static const String tableSql =
      'CREATE TABLE $_tableCity($_idCity INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $_idState INTEGER NOT NULL, $_name varchar(20) not null';
  static const String _tableCity = 'City';
  static const String _idCity = '_idCity';
  static const String _idState = '_idState';
  static const String _name = 'name';

  Future<int> save(City state) async {
    final Database db = await getDatabase();
    Map<String, dynamic> userMap = state.toMap();
    return db.insert(_tableCity, userMap);
  }

  Future<dynamic> getData() async {
    await Future.delayed(const Duration(seconds: 1));
    /* Exemplo de dados retornados */
    final json = jsonDecode('''[

      ]''');
    return json;
  }
}
