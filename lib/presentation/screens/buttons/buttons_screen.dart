import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Buttons Screen.')),
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              context.pop();
              //O Navigator.of(context).pop();
            }));
  }
}

class _ButtonsView extends StatelessWidget {
  /*Opcional al ser _privado si no se requiere.
  const _ButtonsView({super.key});
  */
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    /*infinity significa que tomara todo el espacio del padre hey que ser cuidadosos porque se puede caer
    en un problema cuando el widgetno tiene una dimension especifica y puede dar error pero se dejara aunque
    se debe de evitar pero se puede usar.
    Wrap es como las columnas o filas(rows) solo que por defecto creara los botones o los organizara
    horizontalmente y cuando no haya espacio pasara a la linea vertical y luego volvera al horizontal
    y asi sucesivamente.
    Y los botones se colocan los colores si not tienen uno especifico por el del tema y si no es eso
    el sistema.
    */
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child:
                Wrap(spacing: 10, alignment: WrapAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text('Elevated Button.')),
              ElevatedButton(
                  onPressed: null, child: const Text('Elevated Disabled.')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.access_alarm_rounded),
                  label: Text('Elevated Icon.')),
              FilledButton(onPressed: () {}, child: const Text('Filled.')),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.accessibility_new),
                  label: Text('Filled Icon.')),
              OutlinedButton(onPressed: () {}, child: const Text('Outline.')),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.terminal),
                  label: const Text('Outlined Icon.')),
              TextButton(onPressed: () {}, child: const Text('Text.')),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.account_box_outlined),
                  label: const Text('Text Icon.')),
              _CustomButton(),    
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.app_registration_rounded)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.app_registration_rounded),
                  style: ButtonStyle(
                    /*
                Antes era asi
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: MaterialStatePropertyAll(Colors.white),
                hay varios estados como presionarlo,splash Screen,los colores,el borde hasta lo que pueda
                hacer o tenga estructurado en eso o especifico en caracteristicas del widget.
                */
                    backgroundColor: WidgetStatePropertyAll(colors.primary),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                  ))
            ])));
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    /*
    Se puede colocar en el onTap que si es nulo el color cambie y se deshabilite,para hacer click el InkWell
    es como un gesture Detector para reaccionar a el splash screen y colocar las acciones.
    */
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(color: colors.primary,child:InkWell(
        onTap:(){

        },child: Padding(padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
        child: Text('Hola Mundo',style:TextStyle(color:Colors.white)))
      ))
    );
  }
}
