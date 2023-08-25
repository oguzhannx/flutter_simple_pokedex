import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokedexApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<Pokemon>> getPokemonData() async {
    List<Pokemon> list = [];
    var result = await Dio().get(_url);
    var pokemonList = jsonDecode(result.data)["pokemon"];
    if (pokemonList is List) {
      list = pokemonList.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
    }
    return list;
  }
}
