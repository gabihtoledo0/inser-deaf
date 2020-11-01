import 'package:flutter/material.dart';

class HomePageInter extends StatefulWidget {
  HomePageInter({
    Key key,
  }) : super(key: key);
  @override
  _HomePageInterState createState() => _HomePageInterState();
}

class _HomePageInterState extends State<HomePageInter> {
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(padding: EdgeInsets.all(28.0), children: <Widget>[
          SizedBox(
          height: 82.0,
        ),
          Text('listagem usuarios',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.pink))
        ]));
  }
}
