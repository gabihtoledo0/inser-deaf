import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
            "CRIAR CONTA",
            style: TextStyle(
              fontSize: 15.0
            ),
          ),
           textColor: Colors.white,
           onPressed: (){},
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email"
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty || !text.contains("@")) return "Email inválido!";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Senha",
              ),
              obscureText: true,
              validator: (text){
                if(text.isEmpty || text.length < 8) return "Senha inválido!";
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: (){},
                child: Text("Esqueci minha senha",
                textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              )
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text("Entrar",
                  style: TextStyle(
                    fontSize: 18.0
                    ),
                ),
                textColor: Colors.blueGrey[800],
                color: Colors.blue[200],
                onPressed: (){
                  if(_formKey.currentState.validate()){
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}