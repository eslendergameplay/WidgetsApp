import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

extension ColorExtension on Color {
  String toHex() =>
      '#${(a.toInt() << 24 | r.toInt() << 16 | g.toInt() << 8 | b.toInt()).toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    //final isDarkMode = ref.watch(lightOrDarkModeProvider);

    return Scaffold(
      appBar: AppBar(title: Text('ThemeChanger.'), actions: [
        IconButton(
            icon: Icon((isDarkMode)
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              /*
               ref
                  .read(lightOrDarkModeProvider.notifier)
                  .update((state) => state = !state);
              */
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              /*
            Esta es una forma facil y dulce de decirle por medio del .notifier que automaticamente a los provider
            centrados,de las variablesque cambien por nosotros al usar el provider,el stateProvider
            le decimos a riverpod que cree el manejador del estado al usar el StateNotifierProvider
            esta en nuestras manos establecera el notificador a mano y saber como manejar las propiedades
            de la clase dentro del notificador o controller. 
            */
            })
      ]),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  //opcional super.key al ser _privado
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*riverpod sabra cuando cambiaran y se coloca ref.watch(coloListProvider); Por si el dia de manana se
    quiere hacer dinamico*/
    final List<Color> colors = ref.watch(colorListProvider);
    //final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              title: Text('Este Color.', style: TextStyle(color: color)),
              value: index,
              //groupValue la posicion de la opcion en el grupo
              groupValue: selectedColor,
              onChanged: (value) {
                /*ref
                    .read(selectedColorProvider.notifier)
                    .update((state) => state = index /*o value!*/);
                ref.read(selectedColorProvider.notifier).state = index;
                */
                ref
                    .read(themeNotifierProvider.notifier)
                    .changeColorIndex(index);
                //o .changeColorIndex(value!);
              },
              subtitle: Text('Color : ${color.toHex()}'),
              activeColor: color);
        });
        /*
        Si se quiere que el provider reaccione y sepa cuales son las listas de colores a hacer algo en base
        a la constante colorList que nunca cambie al ser constante tambien se quiera para colores en widget
        Ref para tener acceso desde un provider con un provider normal.
        Donde se haga uso del ref se puede leer y ir al colorListProvider o estar pendiente de cambios
        o leer un valor de un provider.
        */
  }
}
