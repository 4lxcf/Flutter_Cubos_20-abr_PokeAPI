import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/MVC/poke_model.dart';

void main() {
  test('FetchPokemon should receive a pokemon.', () {
    //Preparation
    final model = PokeModel();
    //Test - Method
    model.fetchPokemon(1);
    //Result Expected - Alternative 1
    expect(
      model.pokemon,
      completion(isNotNull),
    );

    //Result Expected - Alternative 2
    model.pokemon.then((pokemon) => expectLater(pokemon.name, 'bulbasaur'));
  });
}
