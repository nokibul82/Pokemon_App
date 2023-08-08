import 'package:flutter/material.dart';
import 'package:pokemon_app/view/widgets/animated_progress_indicator_widget.dart';
import '../../models/pokemon_model.dart';

class StatusTabWidget extends StatelessWidget {
  const StatusTabWidget({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedProgressIndicator(value: 0.7),
      ],
    );
  }
}