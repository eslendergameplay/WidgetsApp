import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final pageViewController = PageController();
  bool endReached = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  child: const Text('Salir.'),
                  onPressed: () {
                    context.pop();
                  })),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                      from: 15,
                      delay: const Duration(seconds: 1),
                      child: FilledButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text('Comenzar.'))))
              : SizedBox()
          //Se aconseja usar SizedBox porque sin nada es de 0 pixeles.
        ]));
  }

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      /*
      Aqui con el pageViewController al moverlo se registra el moviento desde 0.0 hasta 2.0 y va avanzando por
      0.5 o 1.5 se deja slides.lenght -1.5 para al ir a la mitad de 3 y en la segunda pagina 1.0 vaya a la
      mitad y aparezca el widget por condicion.
      */
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose;
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    //mainAxisAlignment vertical y crossAxisAlignment horizontal
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              /*
      Hay Image.asset(),Image.file(),Image.memory() y Image.network()
      */
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),
              const SizedBox(height: 10),
              Text(caption, style: captionStyle),
            ])));
  }
}

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida', 'Aqui puedes buscar comida.', 'assets/images/1.png'),
  SlideInfo(
      'Entrega Rapida',
      'Aqui se entrega rapido la comida y si no es gratis.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida.',
      'Despues de la entrega viene tu comida para disfrutar viendo videos o con familia',
      'assets/images/3.png')
];
