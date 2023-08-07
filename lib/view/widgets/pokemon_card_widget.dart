import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../controllers/pokemon_controller.dart';
import '../../models/pokemon_model.dart';
import '../../view/screens/pokemon_details_screen.dart';

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
                  onTap: () {
                    Get.to(
                        () => PokemonDetailsScreen(
                              pokemon: pokemon,
                            ),
                        transition: Transition.fadeIn);
                  },
                  child: Hero(
                    tag: pokemon.id.toString(),
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
                              child: CachedNetworkImage(
                                  imageUrl: pokemon.sprites!.frontDefault,
                                  fit: BoxFit.fitHeight,
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          SpinKitSpinningLines(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        children: pokemon.types!.map((e) {
                                      return Text("#${e.type.name} ");
                                    }).toList()),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      pokemon.name![0].toUpperCase() +
                                          pokemon.name!.substring(1),
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .animate(
                  autoPlay: true, onPlay: (controller) => controller.repeat())
              .shimmer(
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 2),
                  delay: const Duration(seconds: 2));
        });
  }
}
