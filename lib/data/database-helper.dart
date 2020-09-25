import 'dart:async';
import 'dart:io';
import 'package:inserdeaf/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final DatabaseHelper _instace = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instace;

  static Database _db;

  // usado para definiar o nome das colunas
  final String userTable = 'User';
  final String colName = 'name';
  final String colSurname = 'surname';
  final String colEmail = 'email';
  final String colSenha = 'senha';
  final String colPhone = 'phone';

  Future<Database> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, surname TEXT, email TEXT, senha TEXT, phone ENUM, flaglogged TEXT)");
      print("Table is created");
  }

  //incluir um objeto contato no banco de dados
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    print(user.name);
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

   //deletar um usuario do banco de dados
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<User> selectUser(User user) async {
    print("Select User");
    print(user.email);
    print(user.senha);
    var dbClient = await db;
    List<Map> maps = await dbClient.query(userTable,
      columns: [colEmail, colSenha],
      where: "$colEmail = ? and $colSenha = ?",
      whereArgs: [user.email, user.senha]);
    print(maps);
    if(maps.length > 0) {
      print("User Exist !!!");
      return user;
    }else {
      return null;
    }
  }

  //atualizar o objeto usuario e salva no banco de dados
 /*  Future<int> updateUser(User user) async {
    Database db = await this.database;

    var resultado = await db.update(userTable, user.toMap(),
      where: '$colId = ?',
      whereArgs: [user.id]);

    return resultado;
  } */

//deletar um usuario do banco de dados
  /* Future<int> deleteUser(int id) async {
    var db = await this.database;

    int resultado = await db.delete(userTable,
      where: '$colId = ?',
      whereArgs: [id]);

    return resultado;
  } */

  //obtem o numero de objetos no banco de dados
  /* Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $userTable');

    int resultado = Sqflite.firstIntValue(x);
    return resultado;
  } */

  //fechar banco de dados
  /* Future close() async {
    Database db = await this.database;
    db.close();
  } */
}