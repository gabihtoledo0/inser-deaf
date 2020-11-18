import 'package:Inserdeaf/models/interpreter.dart';
import 'package:flutter/material.dart';
import 'package:Inserdeaf/pages/register/validator.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../primaryScreen.dart';

Validator valida = Validator();
InterpreterDao interDao = InterpreterDao();

class ProfileInter extends StatefulWidget {
  final int interId;
  final InterpreterDao interDao;
  final Validator valida;
  ProfileInter({this.interId, this.valida, this.interDao});

  @override
  _ProfileInterState createState() => _ProfileInterState();
}

class _ProfileInterState extends State<ProfileInter> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confSenhaController = TextEditingController();
  final _cityController = TextEditingController();
  final _descController = TextEditingController();

  bool editado = false;
  Interpreter _editaInter;

  final maskFormatter = new MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: setupInter(),
        builder: (_, snapShot) {
          if (snapShot.hasData) {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Meus Dados"),
                  backgroundColor: Colors.lightBlue[900],
                  actions: [
                    FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrimaryScreen()),
                        );
                      },
                      child: Text("SAIR"),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                body: Form(
                    key: _formKey,
                    child: GestureDetector(
                      child: ListView(
                          padding: EdgeInsets.all(28.0),
                          children: <Widget>[
                            JobLoginImageAsset(),
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
                                _editaInter.name = text;
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
                                _editaInter.surname = text;
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
                                _editaInter.phone = text;
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
                                _editaInter.email = text;
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
                                _editaInter.senha = text;
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
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: _cityController,
                              decoration: InputDecoration(
                                  labelText: "Cidade",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.location_city)),
                              keyboardType: TextInputType.streetAddress,
                              validator: valida.validarNome,
                              onChanged: (text) {
                                editado = true;
                                _editaInter.city = text;
                              },
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: _descController,
                              decoration: InputDecoration(
                                  labelText: "Descrição",
                                  hintText: "Conte sobre sua carreira",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.location_city)),
                              keyboardType: TextInputType.text,
                              maxLines: 8,
                              maxLength: 300,
                              onChanged: (text) {
                                editado = true;
                                _editaInter.desc = text;
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
                                    Navigator.pop(context, _editaInter);
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

  Future<Interpreter> setupInter() async {
    _editaInter = await interDao.getInter(widget.interId);

    if (_editaInter != null) {
      _nameController.text = _editaInter.name;
      _surnameController.text = _editaInter.surname;
      _emailController.text = _editaInter.email;
      _senhaController.text = _editaInter.senha;
      _phoneController.text = _editaInter.phone;
      _cityController.text = _editaInter.city;
      _descController.text = _editaInter.desc;

      return _editaInter;
    }
    return null;
  }
}

class JobLoginImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/profile.png');
    Image image = Image(image: assetImage, height: 180);
    return Container(
      child: image,
    );
  }
}
