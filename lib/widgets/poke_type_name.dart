import 'package:alparen/constants/constants.dart';
import 'package:alparen/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
      
            children: [
              Expanded(child: Text(pokemon.name ?? '',style: Constants.getPokemonNameTextStyle(),)),
              Text('#${pokemon.num}',style: Constants.getPokemonNameTextStyle(),),
            ],
          ),
          SizedBox(height: 0.02.sh,),
          Chip(label: Text(pokemon.type?.join(' , ') ?? '', style: Constants.getChipTextStyle(),))
        ],
      ),
    );
  }
}