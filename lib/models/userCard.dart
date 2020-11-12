class UserCard {
  int id;
  String nome;
  String telefone;
  String horario;
  DateTime data;
  String cep;

  UserCard(
      this.id, this.nome, this.telefone, this.horario, this.data, this.cep);

  @override
  String toString() {
    return 'UserCard{id: $id, nome: $nome, telefone: $telefone, horario: $horario, data: $data, cep: $cep}';
  }

  UserCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        telefone = json['telefone'],
        horario = json['horario'],
        data = json['data'],
        cep = json['cep'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'telefone': telefone,
        'horario': horario,
        'data': data,
        'cep': cep,
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['nome'] = nome;
    map['telefone'] = telefone;
    map['horario'] = horario;
    map['data'] = data;
    map['cep'] = cep;
    return map;
  }
}
