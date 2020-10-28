import 'package:Inserdeaf/models/interpreter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/database-helper.dart';

class InterpreterDao {
  static const String tableSql =
      'CREATE TABLE $_tableInterpreter($_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $_name varchar(20) not null, $_surname varchar(60) not null, $_email varchar(60) not null, $_senha varchar(50) not null, $_phone varchar(11) not null, $_city varchar(40) not null, $_desc varchar(300) null);';
  static const String _tableInterpreter = 'Interpreter';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _surname = 'surname';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _phone = 'phone';
  static const String _city = 'city';
  static const String _desc = 'desc';

  //insere um usuario no banco
   Future<int> insert(Interpreter user) async {
    final Database db = await getDatabase();
    final bool hasInter = await containsUser(user);
    if (!hasInter) {
      var resultado = await db.insert(_tableInterpreter, user.toMap());
      return resultado;
    }
    return null;
  }

  Future<bool> containsUser(Interpreter inters) async {
    final Database db = await getDatabase();
    List<Map> inter = await db.query(_tableInterpreter,
        columns: [_email], where: "$_email = ?", whereArgs: [inters.email]);
    print("procurando email...");
    return inter != null && inter.isNotEmpty;
  }

  Future<Interpreter> find(String email, String senha) async {
    final Database db = await getDatabase();
    List<Map> interprete = await db.query(_tableInterpreter,
        columns: [_email, _senha],
        where: "$_email = ? and $_senha = ?",
        whereArgs: [email, senha]);
    print("procurando interprete...");
    print(interprete);
    if (interprete.length >= 1)
      return Interpreter(
        interprete[0]['id'],
        interprete[0]['name'],
        interprete[0]['surname'],
        interprete[0]['email'],
        interprete[0]['senha'],
        interprete[0]['phone'],
        interprete[0]['city'],
        interprete[0]['desc'],
      );
    return null;
  }

  Future<Interpreter> auth(String email, String senha) async {
    Interpreter hasInter = await find(email, senha);
    if (hasInter != null) return hasInter;
    return null;
  }

  //retorna todos os usuarios
  Future<List<Interpreter>> getInterpreter() async {
    final Database db = await getDatabase();
    var resultado = await db.query(_tableInterpreter);

    List<Interpreter> list = resultado.isNotEmpty
        ? resultado.map((c) => Interpreter.fromJson(c)).toList()
        : [];
    return list;
  }
}
