class Pokemon {
  String name;
  String urlImage;
  String type1;
  String type2;

  Pokemon.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    urlImage = map['sprites']['other']['official-artwork']['front_default'];
    // type1 = map['types'][0]['type'];
    // type2 = map['types'][1]['type'];
  }
}
