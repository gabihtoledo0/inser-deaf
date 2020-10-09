class City {
  int idState;
  int idCity;
  String name;

  City(this.idState, this.idCity, this.name);

  @override
  String toString() {
    return 'City{idState: $idState, idCity: $idCity, name: $name}';
  }

  City.fromJson(Map<String, dynamic> json)
    : idState = json['idState'],
    idCity = json['idCity'],
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
