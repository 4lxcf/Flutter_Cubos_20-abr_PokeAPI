import 'package:pokemon_app/API/poke_api.dart';
import 'package:pokemon_app/Components/pokemon.dart';

class PokeModel {
  Future<Pokemon> _pokemon;
  final API api;
  Future<Pokemon> get pokemon => _pokemon;

  PokeModel({this.api = const API()});

  fetchPokemon(int number) {
    _pokemon = api.fetchPokemon(number);
  }
}
