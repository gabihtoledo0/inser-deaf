class UserCard {
  int id;
  String horario;
  DateTime data;
  String cep;

  UserCard(this.id, this.horario, this.data, this.cep);

  @override
  String toString() {
    return 'UserCard{id: $id, horario: $horario, data: $data, cep: $cep}';
  }

  UserCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        horario = json['horario'],
        data = json['data'],
        cep = json['cep'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'horario': horario,
        'data': data,
        'cep': cep,
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['horario'] = horario;
    map['data'] = data;
    map['cep'] = cep;
    return map;
  }
}
