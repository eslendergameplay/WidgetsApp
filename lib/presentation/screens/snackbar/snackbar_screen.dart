import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Snackbars y Dialogos.')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Aqui se pueden ver las licencias usadas por la aplicacion por lo que se pueden ver en ver las licencias')
                ]);
              },
              child: Text('Licencias usadas.')),
          FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar Dialogo.'))
        ])),
        floatingActionButton: FloatingActionButton.extended(
            label: Text('Mostrar Sncackbar'),
            onPressed: () {
              /*
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:const Text('Hola Usuario.')));
              para llamar el snackbar se puede colocar el key en el Scaffold y en general no importa donde
              este flutter se encargara de encontrar el Scaffolf mas cercano y construye el snackbar
              con el key o lo que esta a continuacion.
              Y al hacer click se coloca y empuja el floatingActionButton arriba y se mantiene por
              un tiempo y con el Scaffold.
              */
              showCustomSnackBar(context);
            },
            icon: Icon(Icons.remove_red_eye_outlined)));
  }
}

void showCustomSnackBar(BuildContext context) {
  //Para evitar desbordamientos de tocar una vez y otra y se acumulen.
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(
      content: const Text('Hola Usuario.'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2));
  //Y se cierra al hacer las acciones.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void openDialog(BuildContext context) {
  //barrierDismissible para evitar que el usuario cierre el dialogo al tocar afuera.
  showDialog(barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
              title: const Text('¿Estas Seguro?'),
              content: const Text(
                  'Aqui se colocara el texto del contenido del dialogo.'),
              actions: [
                TextButton(
                    onPressed: () {
                      //O Navigator.of(context).pop();
                      context.pop();
                    },
                    child: const Text('Cancelar')),
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Aceptar.')),
              ]));
}
