import 'package:Inserdeaf/models/interpreter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/database-helper.dart';

class InterpreterDao {
  static const String tableSql =
      'CREATE TABLE $_tableInterpreter($_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $_name varchar(20) not null, $_surname varchar(60) not null, $_email varchar(40) not null, $_senha varchar(30) not null, $_phone varchar(11) not null, $_city varchar(20) not null, $_desc varchar(300) null);';
  static const String _tableInterpreter = 'Interpreter';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _surname = 'surname';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _phone = 'phone';
  static const String _city = 'city';
  static const String _desc = 'desc';

  Future<int> save(Interpreter interpreter) async {
    final Database db = await getDatabase();
    Map<String, dynamic> userMap = interpreter.toMap();
    return db.insert(_tableInterpreter, userMap);
  }

  // Future<int> saveUser(User user) async {
  //   final Database db = await getDatabase();
  //   print(user.name);
  //   int res = await db.insert('Users', user.toMap());
  //   List<Map> list = await db.rawQuery('SELECT * FROM Users');
  //   print(list);
  //   return res;
  // }

  Future<int> insert(Interpreter interprete) async {
    final Database db = await getDatabase();
    int id = await db.insert(_tableInterpreter, interprete.toMap());
    print('inserted1: $id');
    return id;
  }

  Future<Interpreter> find(String email, String senha) async {
    final Database db = await getDatabase();
    List<Map> interprete = await db.query(_tableInterpreter,
        columns: [_email, _senha],
        where: "$_email = ? and $_senha = ?",
        whereArgs: [email, senha]);
    print("procurando usuário...");
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
}
