import 'package:inserdeaf/main.dart';
import 'package:inserdeaf/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:inserdeaf/data/database-helper.dart';

class UserDao {
  static const String tableSql = 'CREATE TABLE $_tableUser('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT,'
      '$_surname TEXT,'
      '$_email TEXT,'
      '$_senha TEXT,'
      '$_phone TEXT)';
  static const String _tableUser = 'Users';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _surname = 'surname';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _phone = 'phone';

  final DatabaseHelper db;
    UserDao(this.db) {
      db.init();
    }

  Future<int> save(User user) async {
    final Database db = await getDatabase();
    Map<String, dynamic> userMap = _toMap(user);
    return db.insert(_tableUser, userMap);
  }

  Map<String, dynamic> _toMap(User user) {
    final Map<String, dynamic> userMap = Map();
    userMap[_name] = user.name;
    userMap[_surname] = user.surname;
    userMap[_email] = user.email;
    userMap[_senha] = user.senha;
    userMap[_phone] = user.phone;
    return userMap;
  }

  // Future<int> saveUser(User user) async {
  //   final Database db = await getDatabase();
  //   print(user.name);
  //   int res = await db.insert('Users', user.toMap());
  //   List<Map> list = await db.rawQuery('SELECT * FROM Users');
  //   print(list);
  //   return res;
  // }

  insert() async {
    final Database db = await getDatabase();
    int id1 = await db.rawInsert(
        'INSERT INTO Test(name, surname, email, senha, phone) VALUES("gabriela", "toledo", "gabi@gabi", "12345678", "92323-3232")');
    print('inserted1: $id1');
  }

  find(String email, String senha) async {
    final Database db = await getDatabase();
    List<Map> findUser = await db.rawQuery(
        "SELECT email, senha FROM Users WHERE $_email = email AND $_senha = senha LIMIT 1");
    //db.execute("SELECT user.email user.password FROM users WHERE user.email = email AND user.password = password") LIMIT 1;
    print("procurando usuário...");
    print(findUser);
    // Validators.validEmail(email);
    // User gabi = User(email: "gabi@gabi", password: "123");
    // if (email == gabi.email && password == gabi.password)
    //   return gabi;
    // return null;
    return findUser;
  }

  auth(String email, String senha) {
    User hasUser = find(email, senha);
    if (hasUser != null) return hasUser;
    return null;
  }

  Future<User> findUser(User user, String email, String senha) async {
    print("Select User");
    print(user.email);
    print(user.senha);
    final Database db = await getDatabase();
    List<Map> maps = await db.query(tableSql,
        columns: [_email, _senha],
        where: "$_email = ? and $_senha = ?",
        whereArgs: [user.email, user.senha]);
    print(maps);
    if (maps.length > 0) {
      print("User Exist !!!");
      return user;
    } else {
      print("User not exist");
      return null;
    }
  }
}
