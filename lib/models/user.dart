class User {
  int id;
  String email;
  String senha;
  num phone;

  User(this.id, this.email, this.senha, this.phone);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': id,
      'email': email,
      'senha': senha,
      'phone': phone
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    senha = map['senha'];
    phone = map['phone'];
  }
}
