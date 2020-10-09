import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/database-helper.dart';
import 'package:Inserdeaf/models/estado.dart';
import 'dart:convert';

class EstadoDao {
  static const String tableSql =
      'CREATE TABLE $_tableEstado($_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $_name varchar(20) not null)';
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
    final json = jsonDecode('''[
      {"id": 1, "name": "Acre"},
      {"id": 2, "name": "Alagoas"},
      {"id": 3,"name": "Amapá"},
      {"id": 4,"name": "Amazonas"},
      {"id": 5,"name": "Bahia"},
      {"id": 6,"name": "Ceará"},
      {"id": 7,"name": "Distrito Federal"},
      {"id": 8,"name": "Espírito Santo"},
      {"id": 9,"name": "Goiás"},
      {"id": 10,"name": "Maranhão"},
      {"id": 11,"name": "Mato Grosso"},
      {"id": 12,"name": "Mato Grosso do Sul"},
      {"id": 13,"name": "Minas Gerais"},
      {"id": 14,"name": "Pará"},
      {"id": 15,"name": "Paraíba"},
      {"id": 16,"name": "Paraná"},
      {"id": 17,"name": "Pernambuco"},
      {"id": 18,"name": "Piauí"},
      {"id": 19,"name": "Rio de Janeiro"},
      {"id": 20,"name": "Rio Grande do Norte"},
      {"id": 21,"name": "Rio Grande do Sul"},
      {"id": 22,"name": "Rondônia"},
      {"id": 23,"name": "Roraima"},
      {"id": 24,"name": "Santa Catarina"},
      {"id": 25,"name": "São Paulo"},
      {"id": 26,"name": "Sergipe"},
      {"id": 27,"name": "Tocantins"}]''');
    return json;
  }

  List<Estado> toList(dynamic json) {
    List<Estado> list = List<Estado>();
    list = (json as List).map((item) => Estado.fromJson(item)).toList();
    return list;
  }
}
