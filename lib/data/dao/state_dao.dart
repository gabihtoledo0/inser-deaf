import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/database-helper.dart';
import 'package:Inserdeaf/models/estado.dart';
import 'dart:convert';

class EstadoDao {
  static const String tableSql =
      'CREATE TABLE $_tableEstado($_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $_name varchar(20) not null';
  static const String _tableEstado = 'Estado';
  static const String _id = 'id';
  static const String _name = 'name';

  Future<int> save(Estado state) async {
    final Database db = await getDatabase();
    Map<String, dynamic> userMap = state.toMap();
    return db.insert(_tableEstado, userMap);
  }

  Future<dynamic> getData() async {
    await Future.delayed(const Duration(seconds: 1));
    /* Exemplo de dados retornados */
    final json = jsonDecode('[{ "id": 1, "name": "SP"}, {"id": 2, "name": "MG"}]');
    return json;
  }

  List<Estado> toList(dynamic json) {
    List<Estado> list = List<Estado>();
    list = (json as List).map((item) => Estado.fromJson(item)).toList();
    return list;
  }
}
