import 'package:flutter/material.dart';
import 'package:inserdeaf/pages/login/login.dart';
import 'package:inserdeaf/data/dao/user_dao.dart';
import 'models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // iniciando banco de dados
  UserDao userDao = UserDao();
  // inserindo um usuário
  userDao.insert(User(1, "Lucas", "Duarte", "lucas@lucas", "123", "94356-7893"));
  // inicializando o app
  runApp(LoginApp(
    userDao: userDao,
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
