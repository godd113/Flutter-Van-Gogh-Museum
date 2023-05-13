import 'package:flutter/material.dart';

class ViewGradient extends StatelessWidget {
  double opacity = 0;
  ViewGradient({super.key, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(opacity)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 0.95],
          ),
        ),
      ),
    );
  }
}
