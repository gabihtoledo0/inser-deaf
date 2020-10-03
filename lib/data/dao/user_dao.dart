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
  static const String _insert =
      'INSERT INTO $_tableUser($_name, $_surname, $_email, $_senha, $_phone, $_city) VALUES(?, ?, ?, ? , ?, ?)';

  Future<int> save(User user) async {
    final Database db = await getDatabase();
    Map<String, dynamic> userMap = user.toMap();
    return db.insert(_tableUser, userMap);
  }

  // Future<int> saveUser(User user) async {
  //   final Database db = await getDatabase();
  //   print(user.name);
  //   int res = await db.insert('Users', user.toMap());
  //   List<Map> list = await db.rawQuery('SELECT * FROM Users');
  //   print(list);
  //   return res;
  // }

  Future<int> insertDeaf(String name, String surname, String phone,
      String email, String senha, String city) async {
    final Database db = await getDatabase();
    int id = await db.rawInsert(_insert);
    return id;
  }

  Future<int> insert(User user) async {
    final Database db = await getDatabase();
    int id = await db.insert(_tableUser, user.toMap());
    return id;
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
