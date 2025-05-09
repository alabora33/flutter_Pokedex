import 'package:alparen/model/pokemon_model.dart';
import 'package:alparen/services/pokedex_api.dart';
import 'package:alparen/widgets/pokelist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}


class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;


  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            // ignore: no_leading_underscores_for_local_identifiers
            List<PokemonModel> _listem = snapshot.data!;
            return GridView.builder(
              itemCount: _listem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3 ), 
              itemBuilder: (context,index)=> PokelistItem(pokemon: _listem[index]));
          }else if(snapshot.hasError){
            return const Center(child: Text("Hata geldi"),);
          // ignore: curly_braces_in_flow_control_structures
          }else return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
  }
}

// ListView.builder(itemCount : _listem.length,itemBuilder: (context, index) {
//               var oankiPokemon = _listem[index];
//               return PokelistItem(pokemon: oankiPokemon);
//             },);