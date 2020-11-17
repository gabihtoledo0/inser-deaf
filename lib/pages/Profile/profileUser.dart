import 'package:flutter/material.dart';
import 'package:Inserdeaf/models/user.dart';
import 'package:Inserdeaf/pages/register/validator.dart';
import 'package:Inserdeaf/data/dao/user_dao.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Validator valida = Validator();
UserDao userDao = UserDao();

class ProfileUser extends StatefulWidget {
  final int userId;
  final UserDao userDao;
  final Validator valida;
  ProfileUser({this.userId, this.valida, this.userDao});

  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confSenhaController = TextEditingController();

  bool editado = false;
  User _editaUsuario;

  final maskFormatter = new MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: setupUser(),
        builder: (_, snapShot) {
          if (snapShot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Meus Dados"),
                  backgroundColor: Colors.lightBlue[900],
                ),
                backgroundColor: Colors.white,
                body: Form(
                    key: _formKey,
                    child: GestureDetector(
                      child: ListView(
                          padding: EdgeInsets.all(28.0),
                          children: <Widget>[
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Nome",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                              ),
                              keyboardType: TextInputType.name,
                              validator: valida.validarNome,
                              onChanged: (text) {
                                editado = true;
                                _editaUsuario.name = text;
                              },
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: _surnameController,
                              decoration: InputDecoration(
                                labelText: "Sobrenome",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.supervisor_account),
                              ),
                              keyboardType: TextInputType.name,
                              validator: valida.validarNome,
                              onChanged: (text) {
                                editado = true;
                                _editaUsuario.surname = text;
                              },
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              inputFormatters: [maskFormatter],
                              decoration: InputDecoration(
                                labelText: "Celular",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.local_phone),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: valida.validarCelular,
                              onChanged: (text) {
                                editado = true;
                                _editaUsuario.phone = text;
                              },
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: valida.validarEmail,
                              onChanged: (text) {
                                editado = true;
                                _editaUsuario.email = text;
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
                                prefixIcon: Icon(Icons.vpn_key),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              validator: valida.validarSenha,
                              onChanged: (text) {
                                editado = true;
                                _editaUsuario.senha = text;
                              },
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: _confSenhaController,
                              decoration: InputDecoration(
                                labelText: "Confirme sua senha",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.vpn_key),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (_confSenhaController) {
                                final senha = _senhaController.text;
                                if (_confSenhaController.isEmpty ||
                                    _confSenhaController != senha)
                                  return "As senhas não conferem";
                              },
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            SizedBox(
                              height: 50.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(color: Color(0xFFF8BBD0))),
                                child: Text(
                                  "Atualizar dados",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                textColor: Colors.blueGrey[900],
                                color: Color(0xFFF8BBD0),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Navigator.pop(context, _editaUsuario);
                                  }
                                },
                              ),
                            ),
                          ]),
                    )));
          }
          return Container(
            height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Future<User> setupUser() async {
    _editaUsuario = await userDao.getUser(widget.userId);

    if (_editaUsuario != null) {
      _nameController.text = _editaUsuario.name;
      _surnameController.text = _editaUsuario.surname;
      _emailController.text = _editaUsuario.email;
      _senhaController.text = _editaUsuario.senha;
      _phoneController.text = _editaUsuario.phone;

      return _editaUsuario;
    }
    return null;
  }
}
