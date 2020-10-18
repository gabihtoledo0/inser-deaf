import 'package:Inserdeaf/pages/register/registerDeaf.dart';
import 'package:Inserdeaf/pages/register/registerInter.dart';
import 'package:flutter/material.dart';
import 'login/login.dart';
import 'package:Inserdeaf/data/dao/user_dao.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';

UserDao userDao = UserDao();
InterpreterDao intepreterDao = InterpreterDao();

class PrimaryScreen extends StatefulWidget {
  final UserDao userDao;
  final InterpreterDao interpreterDao;

  PrimaryScreen({
    this.userDao,
    this.interpreterDao,
  });
  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: ListView(padding: EdgeInsets.all(28.0), children: <Widget>[
        SizedBox(
          height: 82.0,
        ),
        JobLoginImageAsset(),
        SizedBox(
          height: 16.0,
        ),
        Text(
          '"Com a Libras, falamos a mesma língua"',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey[50]),
        ),
        SizedBox(
          height: 48.0,
        ),
        SizedBox(
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            textColor: Colors.blueGrey[900],
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginScreen(
                        userDao: userDao, interpreterDao: intepreterDao)),
              );
            },
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
            ),
            child: Text(
              "Cadastrar Interprete",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            textColor: Colors.blueGrey[900],
            color: Colors.blue[300],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterInter()),
              );
            },
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
            ),
            child: Text(
              "Cadastrar Surdo",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            textColor: Colors.blueGrey[900],
            color: Color(0xFFF8BBD0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterDeaf()),
              );
            },
          ),
        )
      ]),
    );
  }
}

class JobLoginImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo-azul.png');
    return Center(
      child: Container(
        width: 190,
        height: 170,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.fill, image: assetImage)),
      ),
    );
  }
}
