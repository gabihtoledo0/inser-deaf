class User {
  String id;
  String name;
  String surname;
  String email;
  String senha;
  String phone;

  User(this.id, this.name, this.surname, this.email, this.senha, this.phone);

  @override
  String toString() {
    return 'User{id: $id, name: $name, surname: $surname, email: $email, senha: $senha, phone: $phone}';
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        surname = json['surname'],
        email = json['email'],
        senha = json['senha'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'email': email,
        'senha': senha,
        'phone': phone,
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['surname'] = surname;
    map['email'] = email;
    map['senha'] = senha;
    map['phone'] = phone;
    return map;
  }
}
