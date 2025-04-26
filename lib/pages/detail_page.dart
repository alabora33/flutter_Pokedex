import 'package:alparen/constants/ui_helper.dart';
import 'package:alparen/model/pokemon_model.dart';
import 'package:alparen/widgets/poke_information.dart';
import 'package:alparen/widgets/poke_type_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({required this.pokemon,  super.key});

  @override
  Widget build(BuildContext context) {
        String pokeballImageUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait ? _buildPortraitBody(context, pokeballImageUrl):_buildLandScapeBody(context, pokeballImageUrl);
  }
 Scaffold _buildLandScapeBody(BuildContext context, String pokeballImageUrl)
 {
  return Scaffold(
      backgroundColor: UiHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UiHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Expanded(
                          child: Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.img ?? '',
                              height: 0.4.sh,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UiHelper.getDefaultPadding(),
                        child: PokeInformation(pokemonModel: pokemon),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
 }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
    backgroundColor: UiHelper.getColorFromType(pokemon.type![0]),
    body:SafeArea(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Padding(
          padding: UiHelper.getIconPadding(),
          child: IconButton(iconSize:18.w,onPressed: (){
            
            Navigator.of(context).pop();
          },icon: const Icon(Icons.arrow_back_ios_new_rounded), color: Colors.white,),
          
        ),
        PokeTypeName(pokemon: pokemon),
        SizedBox(height: 20.h,),
        Expanded(child:Stack(
        children: [Positioned(top: 0,
        right: 0,child: Image.asset(pokeballImageUrl,  height: 0.12.sh, fit:BoxFit.fitHeight,),), Positioned(bottom:0,left: 0,right: 0,top: 0.10.sh,child:  PokeInformation(pokemonModel: pokemon)),
        Align(
        alignment: Alignment.topCenter,
        child: Hero( tag:pokemon.id!,child:  CachedNetworkImage(imageUrl: (pokemon.img ?? ''),height: 0.18.sh,fit: BoxFit.fitHeight,))
        ) ]

        )


)
      ],
    ))
  );
  }
}