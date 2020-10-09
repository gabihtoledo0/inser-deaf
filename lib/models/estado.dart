class Estado {
  int id;
  String name;

  Estado(this.id, this.name);

  @override
  String toString() {
    return 'Estado{id: $id, name: $name}';
  }

  Estado.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    return map;
  }
}
