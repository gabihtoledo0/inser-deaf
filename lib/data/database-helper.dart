import 'package:Inserdeaf/data/dao/userCard_dao.dart';
import 'package:Inserdeaf/data/dao/user_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
import 'package:Inserdeaf/data/dao/state_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'user.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(UserDao.tableSql);
      db.execute(InterpreterDao.tableSql);
      db.execute(EstadoDao.tableSql);
      db.execute(UserCardDao.tableSql);
    },
    version: 1,
  );
}
