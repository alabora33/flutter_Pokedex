import 'package:alparen/widgets/app_title.dart';
import 'package:alparen/widgets/pokemon_list.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: [
            AppTitle(),
            Expanded(child: const PokemonList()),
          ],
        ),
      )
    );
  }
}