import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/API/poke_api.dart';
import 'package:pokemon_app/Components/pokemon.dart';
import 'package:pokemon_app/MVC/poke_model.dart';

void main() {
  test('FetchPokemon should receive a pokemon.', () {
    //Preparation
    final model = PokeModel(api: MockAPI());
    //Test - Method
    model.fetchPokemon(1);
    //Result Expected - Alternative 1
    expect(
      model.pokemon,
      completion(isNotNull),
    );

    //Result Expected - Alternative 2
    model.pokemon.then((pokemon) => expectLater(pokemon.name, 'Pokemon'));
  });
}

class MockAPI extends API {
  @override
  Future<Pokemon> fetchPokemon(int number) {
    final pokemon = Pokemon('Pokemon');
    return Future.value(pokemon);
  }
}
