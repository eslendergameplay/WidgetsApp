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
              
              showCustomSnackBar(context);
            },
            icon: Icon(Icons.remove_red_eye_outlined)));
  }
}

void showCustomSnackBar(BuildContext context) {
  
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(
      content: const Text('Hola Usuario.'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2));
  
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void openDialog(BuildContext context) {
  
  showDialog(barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
              title: const Text('¿Estas Seguro?'),
              content: const Text(
                  'Aqui se colocara el texto del contenido del dialogo.'),
              actions: [
                TextButton(
                    onPressed: () {
                      
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
