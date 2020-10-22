import 'package:flutter/material.dart';

class HomePageUser extends StatefulWidget {
  HomePageUser({
    Key key,
  }) : super(key: key);
  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(padding: EdgeInsets.all(28.0), children: <Widget>[
          SizedBox(
          height: 82.0,
        ),
          Text('listagem interpretes',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.pink))
        ]));
  }
}
