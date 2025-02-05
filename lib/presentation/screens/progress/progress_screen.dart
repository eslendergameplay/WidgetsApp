import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators.')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: const [
      SizedBox(height: 30),
      Text('Circular Progress Indicator.'),
      //black 45 el 45 es el nivel de opacidad que tan transparente es el color.
      CircularProgressIndicator(
          strokeWidth: 2, backgroundColor: Colors.black45),
      SizedBox(height: 20),
      Text('Circular y Linear Progress Indicators controlados.'),
      /*
        Por defecto el progress indicator no tiene duracion hasta que no se muestre
        se vera girando y el controlado se puede especificar la duracion del mismo y basado en el porcentaje
        que se quiera que tenga cierta completacion o se muestre el camino recorrido.
        */
      SizedBox(height: 10),
      _ControlledProgressIndicator(),
    ]));
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  //const _ControlledProgressIndicator({super.key}); es opcional al ser _privado si no se requiere
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    /*
    Stream.periodic(const Duration(milliseconds:300),(value){
      return (value * 2)/100 de 0.0 a 1.0 y ira desde 0 *2 = 0 /100 es decir,0.0,luego 0.2 hasta llegar a 100
    }).takeWhile((value) = value < 100)//Stream
    */
    final stream = Stream.periodic(const Duration(milliseconds: 300), (value) {
      return (value * 2) / 100;
    }).takeWhile((value) => value < 100);

    //Y es como el FutureBuilder solo que va a un Stream,builder construido en tiempo de ejecucion
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,children:[
                  CircularProgressIndicator(value: progressValue,strokeWidth:2,
                  backgroundColor: Colors.black12),
                  const SizedBox(width: 20),
                  Expanded(child:LinearProgressIndicator(value:progressValue)),
                  /*
                  Si se coloca un Linear Progress Indicator directamente asi como este por defecto esto 
                  marcara un error de espacio para calcular los semanticos,es decir,falta asignarle un espacio
                  sino no sera valido para renderizar el widget o LinearProgressIndicator() sin espacio
                  que asignar a la linea o camino y al estar en un row no hay un limite de ancho,porque por
                  defecto es infinito al no especificar cuanto tiempo o los valores de distancia.
                  */
                ]
              ));
        });
  }
}
