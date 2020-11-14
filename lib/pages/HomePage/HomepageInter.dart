import 'package:Inserdeaf/data/dao/userCard_dao.dart';
import 'package:Inserdeaf/models/userCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageInter extends StatefulWidget {
  final UserCardDao userCardDao;
  HomePageInter({Key key, this.userCardDao}) : super(key: key);
  @override
  _HomePageInterState createState() => _HomePageInterState();
}

class _HomePageInterState extends State<HomePageInter> {
  List<UserCard> userCard = List<UserCard>();
  UserCardDao userCardDao = UserCardDao();

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Usuários"),
          backgroundColor: Colors.lightBlue[900],
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: userCard.length,
          itemBuilder: (context, index) {
            return _listaUserCard(context, index);
          },
        ));
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
                            padding: EdgeInsets.only(right: 3.0),
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
}
