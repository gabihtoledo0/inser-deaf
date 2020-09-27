import 'package:flutter/material.dart';
import 'package:inserdeaf/pages/login/login.dart';
import 'package:inserdeaf/data/dao/user_dao.dart';

void main() {
  runApp(LoginApp(
    userDao: UserDao(),
  ));
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
