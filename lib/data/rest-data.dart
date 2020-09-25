import 'dart:async';
import 'package:inserdeaf/models/user.dart';
import 'package:inserdeaf/data/database-helper.dart';

class RestData {
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String email, String senha) async {
    String flagLogged = "logged";
    //simulate internet connection by selecting the local database to check if user has already been registered
    var user = new User(null, null, email, senha, null, null);
    var db = new DatabaseHelper();
    var userRetorno = new User(null, null, null, null, null, null);
    userRetorno = await db.selectUser(user);
    if (userRetorno != null) {
      flagLogged = "logged";
      return new Future.value(new User(null, null, email, senha, null, flagLogged));
    } else {
      flagLogged = "not";
      return new Future.value(new User(null, null, email, senha, null, flagLogged));
    }
  }
}
