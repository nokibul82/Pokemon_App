import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends StatelessWidget {
  const AnimatedProgressIndicator({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
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
              return CircularProgressIndicator(
                value: value, // Adjust the progress value here
                strokeWidth: 8,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
              );
            },
          ),
        ],
      ),
    );
  }
}
