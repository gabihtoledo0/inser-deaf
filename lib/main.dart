import 'package:flutter/material.dart';
import 'package:inserdeaf/pages/login.dart';

void main() {
  runApp(MyApp());
  imageCache.clear();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InserDeaf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
