import 'package:Inserdeaf/data/dao/userCard_dao.dart';
import 'package:Inserdeaf/models/userCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Profile/profileInter.dart';
import '../../models/interpreter.dart';
import '../../data/dao/interpreter_dao.dart';
import '../Profile/about/about.dart';
import '../primaryScreen.dart';

class HomePageInter extends StatefulWidget {
  final UserCardDao userCardDao;
  final InterpreterDao interDao;
  Interpreter inter;
  HomePageInter({Key key, this.userCardDao, this.inter, this.interDao})
      : super(key: key);
  @override
  _HomePageInterState createState() => _HomePageInterState();
}

class _HomePageInterState extends State<HomePageInter> {
  List<UserCard> userCard = List<UserCard>();
  UserCardDao userCardDao = UserCardDao();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    userCardDao.getChamados().then((lista) {
      setState(() {
        userCard = lista;
      });
    });
  }

  Widget build(BuildContext context) {
    final tabs = [
      ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: userCard.length,
        itemBuilder: (context, index) {
          return _listaUserCard(context, index);
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
                _exibeInter(inter: widget.inter);
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
              icon: Icon(Icons.account_balance, size: 26),
              label: Text(
                "Sobre nós",
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
        title: Text("Usuários"),
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
            child: Text("Sair"),
          )
        ],
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
    String _phone = userCard[index].telefone;
    var url = "tel:$_phone";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _listaUserCard(BuildContext context, int index) {
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
                            userCard[index].titulo,
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
                            userCard[index].data,
                            style: TextStyle(fontSize: 18, height: 1.5),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 4.0),
                          ),
                          Text(
                            userCard[index].horario,
                            style: TextStyle(fontSize: 18, height: 1.5),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            userCard[index].nome,
                            style: TextStyle(fontSize: 18, height: 1.5),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            userCard[index].telefone,
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0),
                          ),
                          OutlineButton(
                            onPressed: () {
                              fazerLigacao(index);
                            },
                            child: Image(
                                image: AssetImage("images/whatsapp.png"),
                                width: 30.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/localizacao.png"))),
                    ),
                    Text(
                      userCard[index].cep,
                      style: TextStyle(fontSize: 14, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }

  void _exibeInter({Interpreter inter}) async {
    final usuarioRecebido = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileInter(interId: inter.id)),
    );

    if (usuarioRecebido != null) {
      if (inter != null) {
        await interDao.updateUser(usuarioRecebido);
        showAlertDialog(context);
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
      title: Text("Usuário atualizado"),
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
}
