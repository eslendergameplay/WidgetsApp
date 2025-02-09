import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

/*
Para que cambie el valor o se renderize el widget primero este debe ser de tipo Consumer que es un tipo de
widget como el StatelessWidget solo que permite ser controlado por el gestor de estado y permite la comunicacion
entre el widget y el provider por referencia que tiene un builder se tendra acceso y se puede construir lo que
necesita,pero es comun que lo que se hace es convertir el StatelessWidget o StatefulWidget en un widget 
especial de riverpod que lo expone en riverpod hay ConsumerWidget(StatelessWidget) y el ConsumerStatefulWidget
(en vez de StatefulWidget) son los que se tienen ofreceran la referncia en el metodo build y este en el 
Statefulwidget esta de manera global en el state y widget ref ocupa la referencia a un provider que no se sabe
hasta que se especifique ya que no importa hasta llegar a ese punto.


*/
class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  //final counterNumber = 0;

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final int counterValue = ref.watch(counterProvider);
    final lORDMode = ref.watch(lightOrDarkModeProvider);

    return Scaffold(
        appBar:
            AppBar(title: const Text('Counter Screen Con Riverpod.'), actions: [
          IconButton(
              onPressed: () {
                /*
            ref.read(lightOrDarkModeProvider.notifier).state = !ref.read(lightOrDarkModeProvider).state; 
                */
                ref.read(lightOrDarkModeProvider.notifier).update((state)=> state = !state);
              },
              icon: Icon((lORDMode)
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ]),
        body: Center(
            child: Text(
                'Valor del Contador : ${(counterValue < 0) ? '0' : counterValue}',
                style: textStyle)),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              /*Para actualizar el valor se hace asi con ref.read(counterProvider)
              ya que watch no se usa en metodos que no sean build o para estar pendiente de los cambios 
              no actualizarlos y es una mala practica.
              ref.read(counterProvider.notifier).state++;
              Aqui no se guarda el anterior solo se matiene o cambia el actual.
              Es algo que riverpod porque en el metodo y puede llevar a efectos raros si se quiere estar por
              delante del counterProvider pero no se redibuja nada.
              Aqui si hay un historial o se sepa el anterior valor.
              */
              ref.read(counterProvider.notifier).state++;
            },
            child: const Icon(Icons.add)));
            /*
            Cada vez que se haga un cambio en el provider se debia hacer un full restart de la aplicacion
            para que riverpod sepa los provider que tiene para usar o utilizar con disponibilidad.
            Hay varios maneras de hacer un cambio de estado en el counterProvider usualmente si se genera
            hacer un cambio ya que por la configuracion basica esta pendiente de los cambios y hacer uso
            de la lectura y las modificaciones son pocas y usar el consumerWidget en la clase o hacer uso
            del widget Consumer(child:widget) que da la referencia a el WidgetRef para comunicar el Provider
            y el consumer.
            Si se quiere saber un color seleccionado se puede crear y colocarlo y mantner o hacer agrupaciones
            ,sepuede un proveedor de seleccion como un filtro para llegar los provider o StateProvider como
            combinacion de muchos providers.
            */
  }
}
