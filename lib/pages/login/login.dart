import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inserdeaf/data/dao/user_dao.dart';
import 'package:inserdeaf/models/user.dart';

class LoginScreen extends StatefulWidget {
  final UserDao userDao;
  LoginScreen({
    Key key,
    this.userDao,
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
              decoration: InputDecoration(hintText: "Email"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains("@"))
                  return "Email inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(
                hintText: "Senha",
              ),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 3) return "Senha inválido!";
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
                  padding: EdgeInsets.zero,
                )),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18.0),
                ),
                textColor: Colors.blueGrey[50],
                color: Colors.blue[900],
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _auth();
                  }
                },
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
    if (user != null)
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