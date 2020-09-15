import 'dart:async';
import 'dart:io';
import 'package:inserdeaf/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;

  // usado para definiar o nome das colunas
  String userTable = 'User';
  String colId = 'id';
  String colName = 'name';
  String colSurname = 'surname';
  String colEmail = 'email';
  String colSenha = 'senha';
  String colPhone = 'phone';

  //construtor nomeado para criar uma instância da classe
  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(DatabaseHelper == null) {
      //executa somente uma vez
    _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }


  Future<Database> get database async {
    if(_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'user.db';

    var userDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return userDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $userTable($colId) INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
    '$colSurname TEXT, ''$colEmail TEXT, $colSenha TEXT, $colPhone ENUM)');
  }

  //incluir um objeto contato no banco de dados
  Future<int> insertUser(User user) async {
    Database db = await this.database;

    var resultado = await db.insert(userTable, user.toMap());

    return resultado;
  }

  //retornar um usuario pelo id
  Future<User> getUser(int id) async {
    Database db = await this.database;

    List<Map> maps = await db.query(userTable,
      columns: [colId, colName, colSurname, colEmail, colSenha, colPhone],
      where: '$colId = ?',
      whereArgs: [id]);

    if(maps.length > 0){
      return User.fromMap(maps.first);
    }else{
      return null;
    }
  }

  //atualizar o objeto usuario e salva no banco de dados
  Future<int> updateUser(User user) async {
    Database db = await this.database;

    var resultado = await db.update(userTable, user.toMap(),
      where: '$colId = ?',
      whereArgs: [user.id]);

    return resultado;
  }

  //deletar um usuario do banco de dados
  Future<int> deleteUser(int id) async {
    var db = await this.database;

    int resultado = await db.delete(userTable,
      where: '$colId = ?',
      whereArgs: [id]);

    return resultado;
  }

  //obtem o numero de objetos no banco de dados
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $userTable');

    int resultado = Sqflite.firstIntValue(x);
    return resultado;
  }

  //fechar banco de dados
  Future close() async {
    Database db = await this.database;
    db.close();
  }
}