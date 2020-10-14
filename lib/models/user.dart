class User {
  int id;
  String name;
  String surname;
  String email;
  String senha;
  String phone;
  String city;

  User(this.id, this.name, this.surname, this.email, this.senha, this.phone,
      this.city);

  @override
  String toString() {
    return 'User{id: $id, name: $name, surname: $surname, email: $email, senha: $senha, phone: $phone, city: $city}';
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        surname = json['surname'],
        email = json['email'],
        senha = json['senha'],
        phone = json['phone'],
        city = json['city'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'email': email,
        'senha': senha,
        'phone': phone,
        'city': city,
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['surname'] = surname;
    map['email'] = email;
    map['senha'] = senha;
    map['phone'] = phone;
    map['city'] = city;
    return map;
  }
}
