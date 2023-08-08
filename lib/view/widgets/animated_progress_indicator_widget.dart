import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends StatelessWidget {
  const AnimatedProgressIndicator({super.key, required this.value, required this.stats});
  final String stats;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                stats,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${(value * 100).toInt()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value), // Adjust the progress value here
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Container(
                  width: 220,
                  height: 10,
                  margin: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary),
                      //(pokeData.type1)
                      value: value,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
