import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/controllers/details_controller.dart';
import 'package:pokemon_app/view/widgets/about_tab_widget.dart';
import 'package:pokemon_app/view/widgets/moves_tab_widget.dart';

import '../../models/pokemon_model.dart';
import '../widgets/status_tab_widget.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    final detailsController = Get.put(DetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withAlpha(200),
        elevation: 0,
        title: Text(
            "About ${pokemon.name![0].toUpperCase()}${pokemon.name!.substring(1)}",
            style: Theme.of(context).textTheme.displayLarge),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Hero(
                        tag: pokemon.id.toString(),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: Get.height * 0.3,
                              autoPlay: true,
                              initialPage: 0),
                          items: [
                            CachedNetworkImage(
                              imageUrl: pokemon.sprites!.frontDefault,
                              fit: BoxFit.fitHeight,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      SpinKitSpinningLines(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            CachedNetworkImage(
                              imageUrl: pokemon.sprites!.frontShiny,
                              fit: BoxFit.fitHeight,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      SpinKitSpinningLines(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            CachedNetworkImage(
                              imageUrl: pokemon.sprites!.backDefault,
                              fit: BoxFit.fitHeight,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      SpinKitSpinningLines(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            CachedNetworkImage(
                              imageUrl: pokemon.sprites!.backShiny,
                              fit: BoxFit.fitHeight,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      SpinKitSpinningLines(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          ],
                        ))
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(
                        curve: Curves.easeIn,
                        duration: const Duration(seconds: 2),
                        delay: const Duration(seconds: 2)),
                Container(
                  child: TabBar(
                    tabs: detailsController.tabList,
                    controller: detailsController.tabController,
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height * 0.48,
                  margin: const EdgeInsets.only(top: 40,left: 40,right: 20),
                  child: TabBarView(
                      controller: detailsController.tabController,
                      children: [
                        AboutTabWidget(pokemon: pokemon,),
                        StatusTabWidget(pokemon: pokemon,),
                        MovesTabWidget(pokemon: pokemon)
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
