import 'package:Inserdeaf/data/dao/userCard_dao.dart';
import 'package:Inserdeaf/models/userCard.dart';
import 'package:Inserdeaf/pages/HomePage/HomepageInter.dart';
import 'package:Inserdeaf/pages/register/registerDeaf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

UserCardDao userCardDao = UserCardDao();

class ChamadoPageUserCard extends StatefulWidget {
  final UserCardDao userCardDao;
  ChamadoPageUserCard({Key key, this.userCardDao}) : super(key: key);
  @override
  _ChamadoPageUserCardState createState() => _ChamadoPageUserCardState();
}

class _ChamadoPageUserCardState extends State<ChamadoPageUserCard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  final maskTelefone = new MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});
  final maskCep = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  final maskData = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]{2}[/]{1}[0-9]{2}[/]{1}[0-9]{4}')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Solicitar Chamado'),
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(28.0), children: <Widget>[
              SizedBox(
                height: 24.0,
              ),
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(
                  labelText: "Ex: Médico",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.assignment_turned_in),
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: "Nome Completo",
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
                controller: _telefoneController,
                inputFormatters: [maskTelefone],
                decoration: InputDecoration(
                  labelText: "Telefone",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: valida.validarCelular,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _cepController,
                inputFormatters: [maskCep],
                decoration: InputDecoration(
                  labelText: "Cep",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.streetview),
                ),
                keyboardType: TextInputType.streetAddress,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: "Data",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.date_range),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _horarioController,
                decoration: InputDecoration(
                  labelText: "Horário",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.hourglass_full),
                ),
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
                    "Solicitar Chamado",
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
    final String titulo = _tituloController.text;
    final String nome = _nomeController.text;
    final String telefone = _telefoneController.text;
    final String cep = _cepController.text;
    final DateTime data = DateTime.parse(_dataController.text);
    final String horario = _horarioController.text;

    var c = UserCard(1, titulo, nome, telefone, horario, data, cep);
    int userCard = await userCardDao.insert(c);

    if (userCard != null) {
      print("Chamado solicitado!");
      showSucessDialog(context);
    }
  }
}

showSucessDialog(BuildContext context) {
  // configura o button
  Widget loginButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePageInter(),
          ));
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Chamado cadastrado com sucesso"),
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
