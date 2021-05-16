import 'package:flutter/material.dart';

class Pokemon {
  String name;
  String urlImage;
  int exp;
  int height;
  int weight;
  int id;
  List<Ability> abilityList;
  List<StatName> statNameList;
  List<Type> typeList;
  List<dynamic> baseStatList = [];

  Map<String, Color> colorMap = {
    'bug': Color.fromRGBO(168, 184, 32, 1),
    'dark': Color.fromRGBO(112, 88, 72, 1),
    'dragon': Color.fromRGBO(112, 56, 248, 1),
    'electric': Color.fromRGBO(248, 208, 48, 1),
    'fairy': Color.fromRGBO(238, 153, 172, 1),
    'fighting': Color.fromRGBO(192, 48, 40, 1),
    'fire': Color.fromRGBO(240, 128, 48, 1),
    'flying': Color.fromRGBO(168, 144, 240, 1),
    'ghost': Color.fromRGBO(112, 88, 152, 1),
    'grass': Color.fromRGBO(120, 200, 80, 1),
    'ground': Color.fromRGBO(224, 192, 104, 1),
    'ice': Color.fromRGBO(152, 216, 216, 1),
    'normal': Color.fromRGBO(168, 168, 120, 1),
    'poison': Color.fromRGBO(160, 64, 160, 1),
    'psychic': Color.fromRGBO(248, 88, 136, 1),
    'rock': Color.fromRGBO(184, 160, 56, 1),
    'steel': Color.fromRGBO(184, 184, 208, 1),
    'water': Color.fromRGBO(104, 144, 240, 1),
  };

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    urlImage = json['sprites']['other']['official-artwork']['front_default'];
    id = json['id'];
    height = json['height'];
    weight = json['weight'];
    exp = json['base_experience'];
    var abilitiesList = json['abilities'] as List;
    var statsList = json['stats'] as List;
    var typesList = json['types'] as List;

    abilityList = abilitiesList.map((item) {
      return Ability.fromJson(item['ability']);
    }).toList();

    statNameList = statsList.map((item) {
      return StatName.fromJson(item['stat']);
    }).toList();

    baseStatList = statsList.map((item) => item['base_stat']).toList();

    typeList = typesList.map((item) {
      return Type.fromJson(item['type']);
    }).toList();

    typesList.forEach((element) {
      typeList.add(element);
    });
  }
}

class Ability {
  String name;
  String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class StatName {
  String name;
  String url;

  StatName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class Type {
  String name;
  String url;

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
