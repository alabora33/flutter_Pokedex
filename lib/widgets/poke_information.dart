import 'package:alparen/constants/constants.dart';
import 'package:alparen/constants/ui_helper.dart';
import 'package:alparen/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokeInformation({super.key,required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white
      ),
      child: Padding(
        padding: UiHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemonModel.name),
            _buildInformationRow('Height', pokemonModel.height),
            _buildInformationRow('Weight', pokemonModel.weight),
            _buildInformationRow('Spawn Time', pokemonModel.spawnTime),
            _buildInformationRow('Weakness', pokemonModel.weaknesses),
            _buildInformationRow('Pre Evolution', pokemonModel.prevEvolution),
            _buildInformationRow('Next Evolution', pokemonModel.nextEvolution),
          ],
        ),
      ),
    );
  }
  _buildInformationRow(String label,dynamic value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,style: Constants.getPokeInfoLabelTextStyle(),),
        if(value is List && value.isNotEmpty)
          Text(value.join(' , '),style: Constants.getPokeInfoTextStyle(),)
        else if(value == null)
          Text("Not Available",style: Constants.getPokeInfoTextStyle(),)
        else Text(value,style: Constants.getPokeInfoTextStyle())
      ],
    );
  }
}