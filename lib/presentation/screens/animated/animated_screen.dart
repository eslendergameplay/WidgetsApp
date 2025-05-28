import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 100;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Animated Container.')),
        body: Center(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                // Or Curves.bounceOut o Curves.elasticOut
                curve: Curves.easeOutCubic,
                width: (width < 0) ? 0 : width,
                height: (height < 0) ? 0 : height,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(
                        (borderRadius < 0) ? 0 : borderRadius)))),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              changeShape();
            },
            child: const Icon(Icons.play_arrow_rounded)));
  }

  void changeShape() {
    
    final random = Random();
    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    color = Color.fromRGBO(
        random.nextInt(255), //Red
        random.nextInt(255), //Green
        random.nextInt(255), //Blue
        1 //Opacity
        );
    borderRadius = random.nextInt(100) + 20.0;
    setState(() {});
  }
}
