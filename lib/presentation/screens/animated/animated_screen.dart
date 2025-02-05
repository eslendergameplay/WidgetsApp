import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

/*
Si se usa el animated Container en un Stateless Widget solo cambiara con un gestor de estado
en tiempo de ejecucion sino solo al guardar aqui al programarla por eso un StatefulWidget al ser un widget
simple.
*/
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
                // o Curves.bounceOut o Curves.elasticOut
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
              /*si tiene los mismos argumentos y solo esa funcion onPressed: changeShape,*/
            },
            child: const Icon(Icons.play_arrow_rounded)));
  }

  void changeShape() {
    /*
    random.nextBool(),
    .nextDouble(),
    .nextInt()
    se puede usar nextInt aun siendo double por que luego se cambia a .0 pero si es obligado .nextDouble();
    */
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
