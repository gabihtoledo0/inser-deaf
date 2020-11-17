class UserCard {
  int id;
  String titulo;
  String nome;
  String telefone;
  String horario;
  String data;
  String cep;

  UserCard(this.id, this.titulo, this.nome, this.telefone, this.horario,
      this.data, this.cep);

  @override
  String toString() {
    return 'UserCard{id: $id, titulo: $titulo, nome: $nome, telefone: $telefone, horario: $horario, data: $data, cep: $cep}';
  }

  UserCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        nome = json['nome'],
        telefone = json['telefone'],
        horario = json['horario'],
        data = json['data'],
        cep = json['cep'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'nome': nome,
        'telefone': telefone,
        'horario': horario,
        'data': data,
        'cep': cep,
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['titulo'] = titulo;
    map['nome'] = nome;
    map['telefone'] = telefone;
    map['horario'] = horario;
    map['data'] = data;
    map['cep'] = cep;
    return map;
  }
}
