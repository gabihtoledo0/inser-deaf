import 'package:Inserdeaf/data/dao/state_dao.dart';
// import 'package:Inserdeaf/models/estado.dart';
import 'package:Inserdeaf/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
import 'package:Inserdeaf/models/interpreter.dart';
import 'package:Inserdeaf/data/dao/city_dao.dart';
import 'package:Inserdeaf/pages/register/validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

InterpreterDao interDao = InterpreterDao();
EstadoDao stateDao = EstadoDao();
CityDao cityDao = CityDao();
Validator valida = Validator();

class RegisterInter extends StatefulWidget {
  final InterpreterDao interDao;
  final Interpreter inter;
  final EstadoDao stateDao;
  final CityDao cityDao;
  final Validator valida;

  RegisterInter(
      {Key key,
      this.interDao,
      this.inter,
      this.stateDao,
      this.cityDao,
      this.valida})
      : super(key: key);

  @override
  _RegisterInterState createState() => _RegisterInterState();
}

class _RegisterInterState extends State<RegisterInter> {
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
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
    final String city = _cityController.text;
    final String desc = _descController.text;

    var c = Interpreter(1, name, surname, email, senha, phone, city, desc);
    int inter = await interDao.insert(c);

    if (inter != null) {
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
        MaterialPageRoute(
            builder: (context) => LoginScreen(interpreterDao: interDao)),
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
    AssetImage assetImage = AssetImage('images/interprete.png');
    Image image = Image(image: assetImage, height: 250);
    return Container(
      child: image,
    );
  }
}
