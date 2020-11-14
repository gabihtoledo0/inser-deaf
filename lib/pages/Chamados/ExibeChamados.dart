import 'package:Inserdeaf/data/dao/userCard_dao.dart';
import 'package:Inserdeaf/models/userCard.dart';
import 'package:Inserdeaf/pages/Chamados/CriarChamado.dart';
import 'package:Inserdeaf/pages/primaryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChamadoHomePage extends StatefulWidget {
  final UserCardDao userCardDao;
  ChamadoHomePage({Key key, this.userCardDao}) : super(key: key);
  @override
  _ChamadoHomePageState createState() => _ChamadoHomePageState();
}

class _ChamadoHomePageState extends State<ChamadoHomePage> {
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
          title: Text("Chamados"),
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
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userCard[index].nome,
                          style: TextStyle(fontSize: 20, height: 1.5),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                        ),
                        Text(
                          userCard[index].horario,
                          style: TextStyle(fontSize: 20, height: 1.5),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 3.0),
                        ),
                        Text(
                          userCard[index].data.toString(),
                          style: TextStyle(fontSize: 20, height: 1.5),
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
                          padding: EdgeInsets.only(right: 3.0),
                        ),
                        Image(
                            image: AssetImage("images/whatsapp.png"),
                            width: 20.0),
                      ],
                    ),
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
                      userCard[index].cep,
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
