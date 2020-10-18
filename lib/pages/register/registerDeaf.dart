import 'package:Inserdeaf/data/dao/state_dao.dart';
// import 'package:Inserdeaf/models/estado.dart';
import 'package:Inserdeaf/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:Inserdeaf/data/dao/user_dao.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
import 'package:Inserdeaf/models/user.dart';
import 'package:Inserdeaf/data/dao/city_dao.dart';
import 'package:Inserdeaf/pages/register/validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

UserDao userDao = UserDao();
InterpreterDao interDao = InterpreterDao();
EstadoDao stateDao = EstadoDao();
CityDao cityDao = CityDao();
Validator valida = Validator();

class RegisterDeaf extends StatefulWidget {
  final UserDao userDao;
  final InterpreterDao interDao;
  final User user;
  final EstadoDao stateDao;
  final CityDao cityDao;
  final Validator valida;

  RegisterDeaf(
      {Key key,
      this.userDao,
      this.interDao,
      this.user,
      this.stateDao,
      this.cityDao,
      this.valida})
      : super(key: key);

  @override
  _RegisterDeafState createState() => _RegisterDeafState();
}

class _RegisterDeafState extends State<RegisterDeaf> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confSenhaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool editado = false;
  // int _currentItemSelected = 1;
  final maskFormatter = new MaskTextInputFormatter(
      mask: '(##)####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // String dropdownValue = 'Cidades';
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Cadastre-se'),
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(28.0), children: <Widget>[
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
                  if (_confSenhaController.isEmpty)
                    return "As senhas não conferem";
                },
              ),
              // FutureBuilder(
              //   future: stateDao.getData(),
              //   builder: (context, snapshot) {
              //     /* Apenas para desenhar algo enquanto não existir informações pra montar o DropDown */
              //     print(snapshot.hasData);
              //     if (!snapshot.hasData) return Container();

              //     List<Estado> estados = stateDao.toList(snapshot.data);

              //     return DropdownButton<int>(
              //       value: _currentItemSelected,
              //       isExpanded: true,
              //       items: estados.map((item) {
              //         return DropdownMenuItem(
              //           value: item.id,
              //           child: Text(item.name),
              //         );
              //       }).toList(),
              //       onChanged: (value) {
              //         setState(() {
              //           _currentItemSelected = value;
              //         });
              //       },
              //     );
              //   },
              // ),
              // FutureBuilder(
              //   future: cityDao.getData(),
              //   builder: (context, snapshot) {
              //     /* Apenas para desenhar algo enquanto não existir informações pra montar o DropDown */
              //     print(snapshot.hasData);
              //     if (!snapshot.hasData) return Container();

              //     List<City> city = cityDao.toList(snapshot.data);

              //     return DropdownButton<int>(
              //       value: _currentItemSelected,
              //       isExpanded: true,
              //       items: city.map((item) {
              //         return DropdownMenuItem(
              //           value: item.id,
              //           child: Text(item.name),
              //         );
              //       }).toList(),
              //       onChanged: (value) {
              //         setState(() {
              //           _currentItemSelected = value;
              //         });
              //       },
              //     );
              //   },
              // ),
              // DropdownButton<String>(
              //   value: dropdownValue,
              //   icon: Icon(Icons.arrow_downward),
              //   iconSize: 24,
              //   elevation: 16,
              //   isExpanded: true,
              //   style: TextStyle(fontSize: 18, color: Colors.deepPurple),
              //   underline: Container(
              //     height: 2,
              //     color: Colors.blue[600],
              //   ),
              //   onChanged: (String newValue) {
              //     setState(() {
              //       dropdownValue = newValue;
              //     });
              //   },
              //   items: <String>[
              //     "Cidades",
              //     "Adamantina",
              //   ].map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value,
              //           style:
              //               TextStyle(fontSize: 18.0, color: Colors.blue[600])),
              //     );
              //   }).toList(),
              // ),
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
                    "Cadastrar",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.blueGrey[900],
                  color: Color(0xFFF8BBD0),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      register();
                    }
                  },
                ),
              ),
            ])));
  }

  void register() async {
    final String name = _nameController.text;
    final String surname = _surnameController.text;
    final String email = _emailController.text;
    final String senha = _senhaController.text;
    final String phone = _phoneController.text;

    var c = User(1, name, surname, email, senha, phone);
    int user = await userDao.insert(c);

    if (user != null) {
      print("realizado cadastro");
      showSucessDialog(context);
    } else {
      showAlertDialog(context);
      print("usuário já cadastrado");
    }
  }
}

showAlertDialog(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Email já cadastrado"),
    content: Text(
        "Tente cadastrar outro email ou vá até a tela de login e entre com esse email."),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

showSucessDialog(BuildContext context) {
  // configura o button
  Widget loginButton = FlatButton(
    child: Text("LOGIN"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen(userDao: userDao, interpreterDao: interDao),
      );
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Usuário cadastrado com sucesso"),
    actions: [
      loginButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

class JobLoginImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/register.png');
    Image image = Image(image: assetImage, height: 250);
    return Container(
      child: image,
    );
  }
}
