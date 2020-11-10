class UserCard {
  int id;
  String horario;
  DateTime data;
  String cep;
  String titulo;

  UserCard(this.id, this.titulo, this.horario, this.data, this.cep);

  @override
  String toString() {
    return 'UserCard{id: $id, titulo: $titulo, horario: $horario, data: $data, cep: $cep}';
  }

  UserCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        horario = json['horario'],
        data = json['data'],
        cep = json['cep'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'horario': horario,
        'data': data,
        'cep': cep,
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['titulo'] = titulo;
    map['horario'] = horario;
    map['data'] = data;
    map['cep'] = cep;
    return map;
  }
}
