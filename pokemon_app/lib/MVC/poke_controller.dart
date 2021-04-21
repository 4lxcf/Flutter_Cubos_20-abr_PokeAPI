import 'dart:math';

import 'package:pokemon_app/Component/pokemon.dart';
import 'package:pokemon_app/MVC/poke_model.dart';

class PokeController {
  final model = PokeModel();
  int number = 1;

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    number = Random().nextInt(989);
    model.fetchPokemon(number);
  }

  nextPokemon() {
    number++;
    model.fetchPokemon(number);
  }

  previousPokemon() {
    number--;
    model.fetchPokemon(number);
  }
}
