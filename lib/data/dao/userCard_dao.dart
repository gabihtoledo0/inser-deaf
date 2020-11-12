import 'package:Inserdeaf/models/userCard.dart';
import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/database-helper.dart';

class UserCardDao {
  static const String tableSql =
      'CREATE TABLE $_tableUserCard($_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $_titulo varchar(100), $_horario varchar(10) not null, $_data Date not null, $_cep varchar(9) not null;';
  static const String _tableUserCard = 'UserCard';
  static const String _titulo = 'titulo';
  static const String _id = 'id';
  static const String _horario = 'horario';
  static const String _data = 'data';
  static const String _cep = 'cep';

  Future<int> save(UserCard userCard) async {
    final Database db = await getDatabase();
    return db.insert(_tableUserCard, userCard.toMap());
  }

  //Insere chamado
  Future<int> insert(UserCard userCard) async {
    final Database db = await getDatabase();
    var resultado = await db.insert(_tableUserCard, userCard.toMap());
    return resultado;
  }

  //Retorna lista de chamados
  Future<List<UserCard>> getChamados() async {
    final Database db = await getDatabase();
    var resultado = await db.query(_tableUserCard);

    List<UserCard> list = resultado.isNotEmpty
        ? resultado.map((c) => UserCard.fromJson(c)).toList()
        : [];
    return list;
  }

  //Retorna chamado pelo id
  Future<UserCard> getUserCard(int id) async {
    final Database db = await getDatabase();
    List<Map> maps = await db.query(
      _tableUserCard,
      columns: [_id, _titulo, _horario, _data, _cep],
      where: "$_id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return UserCard.fromJson(maps.first);
    } else {
      return null;
    }
  }

  //Atualiza chamado pelo id
  Future<int> updateChamado(UserCard userCard) async {
    final Database db = await getDatabase();
    var resultado = db.update(_tableUserCard, userCard.toMap(),
        where: "$_id = ? ", whereArgs: [userCard.id]);
    return resultado;
  }

  //Deleta chamado pelo id
  Future<int> deleteChamado(int id) async {
    final Database db = await getDatabase();
    var resultado =
        db.delete(_tableUserCard, where: "$_id = ?", whereArgs: [id]);
    return resultado;
  }
}
