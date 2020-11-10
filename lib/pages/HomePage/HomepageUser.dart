import 'package:Inserdeaf/models/interpreter.dart';
import 'package:flutter/material.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
import 'package:url_launcher/url_launcher.dart';

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
          padding: EdgeInsets.all(10.0),
          itemCount: interpreter.length,
          itemBuilder: (context, index) {
            return _listaInterpreter(context, index);
          },
        ));
  }

  fazerLigacao(index) async {
    String _phone = interpreter[index].phone;
    var url = "sms:$_phone";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _listaInterpreter(BuildContext context, int index) {
    return GestureDetector(
        child: Card(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/icone-conta.png"))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          interpreter[index].name,
                          style: TextStyle(fontSize: 20, height: 1.5),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                        ),
                        Text(
                          interpreter[index].surname,
                          style: TextStyle(fontSize: 20, height: 1.5),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          interpreter[index].phone,
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                        ),
                        OutlineButton(
                          onPressed: () {
                            fazerLigacao(index);
                          },
                          child: Image(
                              image: AssetImage("images/whatsapp.png"),
                              width: 20.0),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Text(
                        interpreter[index].desc,
                        style: TextStyle(fontSize: 16, height: 1.5),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 6.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/localizacao.png"))),
                    ),
                    Text(
                      interpreter[index].city,
                      style: TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
