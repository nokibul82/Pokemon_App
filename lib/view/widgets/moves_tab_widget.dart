import 'package:flutter/material.dart';
import '../../models/pokemon_model.dart';

class MovesTabWidget extends StatelessWidget {
  const MovesTabWidget({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Height : ${pokemon.height}"),
      ],
    );
  }
}