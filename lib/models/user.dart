class User {
  int id;
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
    map['name'] = name;
    map['surname'] = surname;
    map['email'] = email;
    map['senha'] = senha;
    map['phone'] = phone;
    return map;
  }

  User copyWith(
      {String name, String surname, String phone, String email, String senha}) {
    return User(
      id ?? this.id,
      name ?? this.name,
      surname ?? this.surname,
      phone ?? this.phone,
      email ?? this.email,
      senha ?? this.senha,
    );
  }
}
