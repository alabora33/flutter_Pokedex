import 'dart:convert';
import 'package:alparen/model/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PokeApi{
  static const String _url_ = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<PokemonModel> _list = [];

    var result  = await Dio().get(_url_);
    var pokeList = jsonDecode(result.data)['pokemon'];
    
    if(pokeList is List){
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    }
    else{
      return [];
    }
    debugPrint(_list.first.toString());
    
    return _list;
  }
}