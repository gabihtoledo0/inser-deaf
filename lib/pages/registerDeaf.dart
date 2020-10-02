import 'package:flutter/material.dart';

class RegisterDeaf extends StatefulWidget {
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
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Text('Cadastre-se'),
          backgroundColor: Colors.blue[900],
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
            ])));
  }
}
