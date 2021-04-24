import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_app/Components/pokemon.dart';

class API {
  Future<Pokemon> fetchPokemon(int number) async {
    var response = await http.get(
      Uri.https(
        'pokeapi.co',
        '/api/v2/pokemon/$number',
      ),
    );
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      response = await http.get(
        Uri.https(
          'pokeapi.co',
          '/api/v2/pokemon/${(number / 3).floor()}',
        ),
      );
      return Pokemon.fromJson(jsonDecode(response.body));
    }
  }
}
