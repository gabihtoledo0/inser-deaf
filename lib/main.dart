import 'package:flutter/material.dart';
import 'package:inserdeaf/pages/login/login.dart';
import 'package:inserdeaf/data/dao/user_dao.dart';
import 'package:inserdeaf/data/database-helper.dart';
import 'data/database-helper.dart';

void main() {
  DatabaseHelper db = DatabaseHelper();
  UserDao userDao = UserDao(db);
  runApp(LoginApp(
    userDao: userDao,
  ));
}

class DatabaseHelper {
  void init() {
    getDatabase();
    print("iniciand banco de dados");
  }
}

class LoginApp extends StatelessWidget {
  final UserDao userDao;
  LoginApp({
    this.userDao,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(userDao: userDao),
    );
  }
}
