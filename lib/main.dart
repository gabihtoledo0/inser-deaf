import 'package:Inserdeaf/pages/primaryScreen.dart';
import 'package:flutter/material.dart';
// import 'package:Inserdeaf/models/interpreter.dart';
// import 'package:Inserdeaf/models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // iniciando banco de dados
  // inserindo um usuário
  // userDao.insert(User(1, "Gabriela", "Toledo Prado", "gabi@gabi", "12345678",
  //     "11943567893", "Caieiras"));
  // intepreterDao.insert(Interpreter(1, "Felipe", "Oliveira", "felipe@felipe",
      // "senha123", "11943567893", "São Paulo", "sou um estudante"));
  // inicializando o app
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimaryScreen(),
    );
  }
}
