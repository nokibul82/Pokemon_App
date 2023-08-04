import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PokemonController(),
        builder: (controller) {
          return InkWell(
                  onTap: () {},
                  child: Card(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                              pokemon.sprites!.frontDefault,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            elevation: 0,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pokemon.name!,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Row(
                                      children: pokemon.types!.map((e) {
                                    return Text("#${e.type.name} ");
                                  }).toList())
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .animate(
                  autoPlay: true,
                  onPlay: (controller) => controller.repeat())
              .shimmer(curve: Curves.easeIn,duration: const Duration(seconds: 2),delay: const Duration(seconds: 4));
        });
  }
}
