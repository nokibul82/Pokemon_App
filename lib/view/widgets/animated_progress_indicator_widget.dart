import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedProgressIndicator extends StatelessWidget {
  const AnimatedProgressIndicator(
      {super.key, required this.value, required this.stats});
  final String stats;
  final int value;

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.23,
              child: Text(
                stats,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(
                  begin: 0,
                  end: (value / 100)), // Adjust the progress value here
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Container(
                  width: width * 0.5,
                  height: 11,
                  margin: const EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary),
                      //(pokeData.type1)
                      value: value,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Countup(
                  begin: 0,
                  end: value.toDouble(),
                  duration: const Duration(seconds: 1),
                  separator: ",",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
