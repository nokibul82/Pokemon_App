import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends StatelessWidget {
  const AnimatedProgressIndicator({super.key, required this.value, required this.stats});
  final String stats;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            stats,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(width: 40,),
          Text(
            '${(value * 100).toInt()}%',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value), // Adjust the progress value here
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Container(
                width: 250,
                height: 10,
                margin: const EdgeInsets.only(left: 15),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.indigoAccent.shade400),
                    //(pokeData.type1)
                    value: value.toDouble(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
