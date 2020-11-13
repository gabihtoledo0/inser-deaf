import 'package:flutter/material.dart';
import 'package:Inserdeaf/models/user.dart';
import 'package:Inserdeaf/pages/register/validator.dart';

Validator valida = Validator();

class ProfileUser extends StatefulWidget {
  final User user;
  final Validator valida;
  ProfileUser({this.user, this.valida});

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

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      _editaUsuario = User.fromJson(widget.user.toMap());
      _nameController.text = _editaUsuario.name;
      _surnameController.text = _editaUsuario.surname;
      _emailController.text = _editaUsuario.email;
      _senhaController.text = _editaUsuario.senha;
      _phoneController.text = _editaUsuario.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meus Dados"),
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: Colors.white,
        body: Form(
          child: ListView(padding: EdgeInsets.all(28.0), children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Nome",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
              validator: valida.validarNome,
            ),
          ]
        ),
      )
    );
  }
}
