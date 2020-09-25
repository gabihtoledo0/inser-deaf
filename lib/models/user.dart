class User {
  String _name;
  String _surname;
  String _email;
  String _senha;
  int _phone;
  String _flaglogged;

  User(this._name, this._surname, this._email, this._senha, this._phone,
      this._flaglogged);

  User.map(dynamic obj) {
    this._name = obj['name'];
    this._surname = obj['surname'];
    this._email = obj['email'];
    this._senha = obj['senha'];
    this._phone = obj['phone'];
    this._flaglogged = obj['senha'];
  }

  String get name => _name;
  String get surname => _surname;
  String get email => _email;
  String get senha => _senha;
  int get phone => _phone;
  String get flaglogged => _flaglogged;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = _name;
    map['surname'] = _surname;
    map['email'] = _email;
    map['senha'] = _senha;
    map['phone'] = _phone;
    map['flaglogged'] = _flaglogged;
    return map;
  }
}
