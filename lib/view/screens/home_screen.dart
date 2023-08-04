import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../view/widgets/pokemon_card_widget.dart';

import '../../controllers/pokemon_controller.dart';

class HomeScreen extends GetView<PokemonController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PokemonController());
    return controller.obx((state) {
      return RefreshIndicator(
        onRefresh: () async {
          controller.refreshPage();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          body: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text(
                "Pokemon App",
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: state?.length,
                    (context, index) => PokemonCardWidget(
                          pokemon: state![index],
                        )),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
              ),
            ),
          ]),
        ),
      );
    },
        onLoading: Scaffold(
          appBar: AppBar(
            title: Text(
              "Pokemon App",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                            .animate(
                              onPlay: (controller) => controller.repeat(), // loop
                            )
                            .shimmer(
                                duration: const Duration(seconds: 1),delay: const Duration(seconds: 1));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
