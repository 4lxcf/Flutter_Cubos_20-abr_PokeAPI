import 'package:pokemon_app/API/poke_api.dart';
import 'package:pokemon_app/Component/pokemon.dart';

class PokeModel {
  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon => _pokemon;

  fetchPokemon(int number) {
    _pokemon = API().fetchPokemon(number);
  }
}
