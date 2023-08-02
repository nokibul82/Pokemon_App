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
            body: CustomScrollView(slivers: [
              SliverAppBar(
                title: Text(
                  "Pokemon App",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: state?.length,
                    (context, index) => PokemonCardWidget( pokemon: state![index],)),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
              ),
            ]),
          ),
      );
    },
      onLoading: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 350,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: 8,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                        .animate(
                      delay: 1000.ms,
                      // this delay only happens once at the very start
                      onPlay: (controller) => controller.repeat(), // loop
                    )
                        .shimmer(duration: const Duration(seconds: 1));
                  }),
            ),
          ],
        ),
      )
    );

  }
}
