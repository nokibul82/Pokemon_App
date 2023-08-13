import 'package:flutter/material.dart';
import 'package:pokemon_app/view/widgets/animated_progress_indicator_widget.dart';
import '../../models/pokemon_model.dart';

class StatusTabWidget extends StatelessWidget {
  const StatusTabWidget({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: pokemon.stats!
          .map((e) =>
              AnimatedProgressIndicator(value: e.baseStat, stats: e.stat.name.toUpperCase()))
          .toList(),
    );
  }
}
