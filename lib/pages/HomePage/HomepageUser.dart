import 'package:Inserdeaf/models/interpreter.dart';
import 'package:flutter/material.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';

class HomePageUser extends StatefulWidget {
  final InterpreterDao interDao;
  HomePageUser({Key key, this.interDao}) : super(key: key);
  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  // final _formKey = GlobalKey<FormState>();
  List<Interpreter> interpreter = List<Interpreter>();
  InterpreterDao interDao = InterpreterDao();

  @override
  void initState() {
    super.initState();
    interDao.getInterpreter().then((lista) {
      setState(() {
        interpreter = lista;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Interpretes"),
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          padding: EdgeInsets.all(28.0),
          itemCount: interpreter.length,
          itemBuilder: (context, index) {
            _listaInterpreter(context, index);
          },
        )
      );
  }

  _listaInterpreter(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(padding: EdgeInsets.all(10.0),
        child: Row(children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("images/icone-conta.png")
              )
            ),
          )
        ],)
        ),
      )
    );
  }
}
