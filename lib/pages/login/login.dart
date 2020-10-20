import 'package:Inserdeaf/pages/primaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Inserdeaf/data/dao/user_dao.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
import 'package:Inserdeaf/models/user.dart';
import 'package:Inserdeaf/models/interpreter.dart';
import 'package:Inserdeaf/pages/register/validator.dart';

import '../../models/interpreter.dart';

class LoginScreen extends StatefulWidget {
  final UserDao userDao;
  final Validator valida;
  final InterpreterDao interpreterDao;
  LoginScreen({
    Key key,
    this.userDao,
    this.valida,
    this.interpreterDao,
  }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(28.0),
          children: <Widget>[
            SizedBox(
              height: 28.0,
            ),
            JobLoginImageAsset(),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (_emailController) {
                if (_emailController.isEmpty || !_emailController.contains("@"))
                  return "Email inválido";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 8) return "Senha inválida";
              },
            ),
            Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueci minha senha",
                    textAlign: TextAlign.right,
                  ),
                  textColor: Colors.blue[900],
                  padding: EdgeInsets.all(3.0),
                )),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.blueGrey)),
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                textColor: Colors.blueGrey[50],
                color: Colors.lightBlue[900],
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _auth();
                  }
                },
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FlatButton.icon(
                textColor: Colors.blueGrey[900],
                onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrimaryScreen()),
              );
                },
                icon: Icon(Icons.keyboard_backspace, size: 24),
                label: Text("Voltar", style: TextStyle(fontSize: 16.0)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _auth() async {
    final String email = _emailController.text;
    final String senha = _senhaController.text;
    User user = await widget.userDao.auth(email, senha);
    Interpreter interpreter = await widget.interpreterDao.auth(email, senha);
    if (user != null || interpreter != null)
      print("autenticado");
    else
      print("não autenticado");
  }
}

class JobLoginImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/job-login.png');
    Image image = Image(image: assetImage, height: 250);
    return Container(
      child: image,
    );
  }
}
