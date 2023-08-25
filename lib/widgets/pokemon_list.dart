import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/services/pokedex_api.dart';
import 'package:flutter_pokedex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<Pokemon>> _pokemonListFuture;
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokedexApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Pokemon> listem = snapshot.data!;
          return GridView.builder(
            itemCount: listem.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: UIHelper.setGrid()),
            itemBuilder: (context, index) {
              var pokemon = listem[index];
              return PokeListItem(pokemon: pokemon);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// ListView.builder(
//             itemCount: listem.length,
//             itemBuilder: (context, index) {
//               var pokemon = listem[index];
//               return PokeListItem(pokemon: pokemon);
//             },
//           );