import 'package:flutter/material.dart';
import 'package:Inserdeaf/data/dao/user_dao.dart';

class RegisterDeaf extends StatefulWidget {

  final UserDao userDao;
  RegisterDeaf({
    Key key,
    this.userDao,
  }) : super(key: key);
  @override
  _RegisterDeafState createState() => _RegisterDeafState();
}

class _RegisterDeafState extends State<RegisterDeaf> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Cidades';
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Cadastre-se'),
          backgroundColor: Colors.lightBlue[900],
        ),
        body: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(28.0), children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.name,
                validator: (_nameController) {
                  if (_nameController.isEmpty || _nameController.length > 20)
                    return "Nome inválido";
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
                validator: (_surnameController) {
                  if (_surnameController.isEmpty ||
                      _surnameController.length > 60)
                    return "Sobrenome inválido";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Celular",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (_phoneController) {
                  if (_phoneController.isEmpty || _phoneController.length > 11)
                    return "Telefone inválido";
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
                validator: (_emailController) {
                  if (_emailController.isEmpty ||
                      !_emailController.contains("@") ||
                      _emailController.length > 60) return "Email inválido";
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
                validator: (_senhaController) {
                  if (_senhaController.isEmpty ||
                      _senhaController.length < 8 ||
                      _senhaController.length > 50) return "Senha inválida";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Confirme sua senha",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.vpn_key),
                ),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (_confSenhaController) {
                  if (_confSenhaController.isEmpty ||
                      _confSenhaController.length > 20)
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
                  prefixIcon: Icon(Icons.vpn_key),
                ),
                keyboardType: TextInputType.streetAddress,
                validator: (_cityController) {
                  if (_cityController.isEmpty || _cityController.length > 40)
                    return "Cidade inválida";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,

                style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.blue[600],
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  "Cidades",
                  "Adamantina",
                ]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                      style: TextStyle(
                        fontSize: 18.0, color: Colors.blue[600]
                      )
                    ),
                  );
                }).toList(),
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
                      _register();
                    }
                  },
                ),
              ),
          ]
        )
      )
    );
  }

  void _register() async {
    final String name = _nameController.text;
    final String surname = _surnameController.text;
    final String email = _emailController.text;
    final String senha = _senhaController.text;
    final String phone = _phoneController.text;
    final String city = _cityController.text;

    int user = await widget.userDao.insertDeaf(name, surname, email, senha, phone, city);
    if (user != null)
      print("cadastrado");
    else
      print("erro no cadastro");
  }
}
