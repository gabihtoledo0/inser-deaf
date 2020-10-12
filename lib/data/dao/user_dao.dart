import 'package:Inserdeaf/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/database-helper.dart';

class UserDao {
  static const String tableSql =
      'CREATE TABLE $_tableUser($_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $_name varchar(20) not null, $_surname varchar(60) not null, $_email varchar(60) not null, $_senha varchar(50) not null, $_phone varchar(11) not null, $_city varchar(40) not null);';
  static const String _tableUser = 'Users';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _surname = 'surname';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _phone = 'phone';
  static const String _city = 'city';

  Future<int> save(User user) async {
    final Database db = await getDatabase();
    return db.insert(_tableUser, user.toMap());
  }

  Future<int> insert(User user) async {
    final Database db = await getDatabase();
    var resultado = await db.insert(_tableUser, user.toMap());
    int hasEmail = await findRegister(user);
    if (hasEmail != null) {
      return resultado;
    }
    return null;
  }

  //insere um usuario no banco
  Future<int> findRegister(User users) async {
    final Database db = await getDatabase();
    List<Map> user = await db.query(_tableUser,
        columns: [_email], where: "$_email = ?", whereArgs: [users.email]);
    print("procurando email...");

    if (user.length >= 1) {
      print("usuario já cadastrado, tentei outro email");
    }
    return null;
  }

  //retorna todos os usuarios
  Future<List<User>> getUsuarios() async {
    final Database db = await getDatabase();
    var resultado = await db.query(_tableUser);

    List<User> list = resultado.isNotEmpty
        ? resultado.map((c) => User.fromJson(c)).toList()
        : [];
    return list;
  }

  //retorna um usuario pelo id
  Future<User> getUser(int id) async {
    final Database db = await getDatabase();
    List<Map> maps = await db.query(
      _tableUser,
      columns: [_id, _name, _surname, _email, _phone, _city],
      where: "$_id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return User.fromJson(maps.first);
    } else {
      return null;
    }
  }

  //atualizar o objeto do usuario no banco
  Future<int> updateUser(User user) async {
    final Database db = await getDatabase();
    var resultado = db.update(_tableUser, user.toMap(),
        where: "$_id = ? ", whereArgs: [user.id]);
    return resultado;
  }

  //deleta um usuario
  Future<int> deleteUser(int id) async {
    final Database db = await getDatabase();
    var resultado = db.delete(_tableUser, where: "$_id = ?", whereArgs: [id]);
    return resultado;
  }

  Future<User> find(String email, String senha) async {
    final Database db = await getDatabase();
    List<Map> user = await db.query(_tableUser,
        columns: [_email, _senha],
        where: "$_email = ? and $_senha = ?",
        whereArgs: [email, senha]);
    print("procurando usuário...");
    print(user);
    if (user.length >= 1)
      return User(
        user[0]['id'],
        user[0]['name'],
        user[0]['surname'],
        user[0]['email'],
        user[0]['senha'],
        user[0]['phone'],
        user[0]['city'],
      );
    return null;
  }

  Future<User> auth(String email, String senha) async {
    User hasUser = await find(email, senha);
    if (hasUser != null) return hasUser;
    return null;
  }
}
