import 'package:Inserdeaf/models/interpreter.dart';
import 'package:flutter/material.dart';
import 'package:Inserdeaf/data/dao/interpreter_dao.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Inserdeaf/pages/Profile/profileUser.dart';

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
  int _currentIndex = 0;

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
    final tabs = [
      ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: interpreter.length,
        itemBuilder: (context, index) {
          return _listaInterpreter(context, index);
        },
      ),
      ListView(children: <Widget>[
        SizedBox(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            child: OutlineButton.icon(
              textColor: Colors.blueGrey[900],
              highlightedBorderColor: Colors.black.withOpacity(0.12),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUser()),
                );
              },
              icon: Icon(Icons.account_balance_wallet, size: 26),
              label: Text(
                "Informações pessoais",
                style: TextStyle(
                  fontSize: 24,
                  height: 1.5,
                ),
              ),
            )),
        SizedBox(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            child: OutlineButton.icon(
              textColor: Colors.blueGrey[900],
              highlightedBorderColor: Colors.black.withOpacity(0.12),
              onPressed: () {
                // Respond to button press
              },
              icon: Icon(Icons.vpn_key, size: 26),
              label: Text(
                "Mudar senha",
                style: TextStyle(
                  fontSize: 24,
                  height: 1.5,
                ),
              ),
            ))
      ]),
    ];
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sair"),
        backgroundColor: Colors.lightBlue[900],
      ),
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.lightBlue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFFF8BBD0).withOpacity(.70),
        selectedLabelStyle: textTheme.caption,
        iconSize: 35,
        unselectedLabelStyle: textTheme.caption,
        onTap: (index) {
          // Respond to item press.
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Perfil'),
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }

  fazerLigacao(index) async {
    String _phone = interpreter[index].phone;
    var url = "tel:$_phone";

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
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          interpreter[index].name,
                          style: TextStyle(
                              fontSize: 22,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.0),
                        ),
                        Text(
                          interpreter[index].surname,
                          style: TextStyle(
                              fontSize: 22,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
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
                        TextButton(
                          onPressed: () {
                            fazerLigacao(index);
                          },
                          child: Image(
                              image: AssetImage("images/whatsapp.png"),
                              width: 30.0),
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
              )),
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
              ),
            ],
          )),
    ));
  }
}
