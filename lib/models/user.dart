class User {
  int id;
  String name;
  String surname;
  String email;
  String senha;
  num phone;

  User(this.id, this.name, this.surname, this.email, this.senha, this.phone);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'senha': senha,
      'phone': phone
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    surname = map['surname'];
    email = map['email'];
    senha = map['senha'];
    phone = map['phone'];
  }

@override
  String toString(){
    return "User => (id: $id, nome: $name, sobreNome: $surname email: $email, senha: $senha, phone: $phone)";
  }
}
