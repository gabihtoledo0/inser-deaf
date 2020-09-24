class User {
  String name;
  String surname;
  String email;
  String senha;
  num phone;
  String flaglogged;

  User(this.name, this.surname, this.email, this.senha, this.phone, this.flaglogged);

  User.map(dynamic obj) {
    this.name = obj['name'];
    this.surname = obj['surname'];
    this.email = obj['email'];
    this.senha = obj['senha'];
    this.phone = obj['phone'];
    this.flaglogged = obj['flaglogged'];
  }

  String get name => name;
  String get surname => surname;
  String get email => email;
  String get senha => senha;
  String get phone => phone;
  String get flaglogged => flaglogged;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    name = map['name'];
    surname = map['surname'];
    email = map['email'];
    senha = map['senha'];
    phone = map['phone'];
    return map;
  }
}
