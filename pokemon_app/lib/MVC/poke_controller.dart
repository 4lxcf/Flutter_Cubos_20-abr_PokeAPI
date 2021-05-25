import 'dart:async';
import 'dart:math';

import 'package:pokemon_app/Components/pokemon.dart';
import 'package:pokemon_app/MVC/poke_model.dart';

class PokeController {
  final model = PokeModel();
  int number = 1;

  Future<Pokemon> get pokemon => model.pokemon;

  StreamController<Pokemon> streamController = StreamController();

  loadPokemon() {
    number = Random().nextInt(987);
    model.fetchPokemon(number);
    model.pokemon.then((value) => streamController.add(value));
  }
}
