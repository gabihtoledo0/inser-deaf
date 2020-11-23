import 'package:flutter/material.dart';
import '../../primaryScreen.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => PrimaryScreen()),
                );
              },
              child: Text("SAIR"),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Text(
                "Em nosso aplicativo caso você seja o intérprete, você verá uma listagem de chamados dos usuários. Mas o que são esses chamados? Esses chamados, são quando os usuários precisam ir ao médico, supermercado, alguma outra forma de consulta e entre outros lugares que precisarão de um intérprete. Com isso, o intérprete pode receber uma mensagem via Whatsapp ou atender a algum chamados para combinarem o local e horário. No caso dos usuários, você receberá uma listagem de intérpretes e com isso, você terá um botão para poder cadastrar seu chamado. Mas o que seria esses chamados? Da mesma forma que funciona com o intérprete, são quando os usuários precisam de um intérprete para ir em alguma consulta, hospital, supermercado e entro outros. Então com isso, os usuários terão á listagem de intérpretes aleatórios para entrar em contato ou caso preferir, criar um chamado e aguardar o intérprete entrar em contato. Também há atualizações de dados, que seriam tanto para usuários quanto para intérpretes que quando estão logados, podem atualizar informações de seu perfil, como por exemplo, seu e-mail de cadastro, telefone para contato, dentre outros.",
                textAlign: TextAlign.left,
                maxLines: 30,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, color: Colors.blueGrey[900]),
              ),
            )));
  }
}
