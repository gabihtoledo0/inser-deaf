class Interpreter {
  int id;
  String name;
  String surname;
  String email;
  String senha;
  String phone;
  String city;
  String desc;

  Interpreter(this.id, this.name, this.surname, this.email, this.senha, this.phone,
      this.city, this.desc);

  @override
  String toString() {
    return 'Interpreter{id: $id, name: $name, surname: $surname, email: $email, senha: $senha, phone: $phone, city: $city, des: $desc}';
  }

  Interpreter.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        surname = json['surname'],
        email = json['email'],
        senha = json['senha'],
        phone = json['phone'],
        city = json['city'],
        desc = json['desc'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'email': email,
        'senha': senha,
        'phone': phone,
        'city': city,
        'desc': desc
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['surname'] = surname;
    map['email'] = email;
    map['senha'] = senha;
    map['phone'] = phone;
    map['city'] = city;
    map['desc'] = desc;
    return map;
  }
}
