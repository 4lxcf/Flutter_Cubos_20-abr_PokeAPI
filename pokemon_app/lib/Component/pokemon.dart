import 'package:flutter/material.dart';

class Pokemon {
  String name;
  String urlImage;
  String type1;
  String type2;
  int id;
  Map<String, Color> colorMap = {
    'normal': Color.fromRGBO(168, 168, 120, 1),
    'fire': Color.fromRGBO(240, 128, 48, 1),
    'water': Color.fromRGBO(104, 144, 240, 1),
    'electric': Color.fromRGBO(248, 208, 48, 1),
    'grass': Color.fromRGBO(120, 200, 80, 1),
    'ice': Color.fromRGBO(152, 216, 216, 1),
    'fighting': Color.fromRGBO(192, 48, 40, 1),
    'poison': Color.fromRGBO(160, 64, 160, 1),
    'ground': Color.fromRGBO(224, 192, 104, 1),
    'flying': Color.fromRGBO(168, 144, 240, 1),
    'psychic': Color.fromRGBO(248, 88, 136, 1),
    'bug': Color.fromRGBO(168, 184, 32, 1),
    'rock': Color.fromRGBO(184, 160, 56, 1),
    'ghost': Color.fromRGBO(112, 88, 152, 1),
    'dragon': Color.fromRGBO(112, 56, 248, 1),
    'dark': Color.fromRGBO(112, 88, 72, 1),
    'steel': Color.fromRGBO(184, 184, 208, 1),
    'fairy': Color.fromRGBO(238, 153, 172, 1),
  };

  Pokemon.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    urlImage = map['sprites']['other']['official-artwork']['front_default'];
    id = map['id'];
    type1 = map['types'][0]['type']['name'];
    if (map.containsValue(1)) {
      type2 = map['types'][1]['type']['name'];
    } else {
      type2 = null;
    }
  }
}
