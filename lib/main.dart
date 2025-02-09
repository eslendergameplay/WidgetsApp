import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  /*El provider scope es un widget que enlaza todos los provider dentro de la aplicacion y se puede colocar
  dentro de un widget especifico para que se redibuje solo eso o aqui para hacerlo global,es decir mantiene
  una referencia a todos los providers que se usan y no crecera mas de eso para buscar cada provider
  que creamos o crearemos.
  Dentro del gestor de estado provider tenemos : Provider,NotifierProvider,StateProvider,FutureProvider
  ,StremaProvider(Streams),FutureProvider(Futures), (Async) Notifier Provider,ChangeNotifierProvider 
  conforme se vayan utilizando se veran mas estos paso a paso y son los providers que hay y dependiendo del
  caso se usara uno u otro.
  Y se puede trabajar con los tres principales StateNotifierProvider,Provider y ChangeNotifierProvider y eso
  es para la mayoria de casos o de diferentes usos como FutureProvider para futures y StreamProvider para 
  trabajar con Streams,State Notifier ya se vera.
  */
  runApp(ProviderScope(child: WidgetApp()));
}

class WidgetApp extends ConsumerWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final selectedColor = ref.watch(selectedColorProvider);
    //final isDarkMode = ref.watch(lightOrDarkModeProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
        title: 'WidgetsApp.',
        debugShowCheckedModeBanner: false,
        theme: appTheme.getTheme(),
        routerConfig: appRouter

      

        /*

        return MaterialApp.router(title:'WidgetsApp.',debugShowCheckedModeBanner:false,
        theme:AppTheme(selectdColor:selectedColor:selectedColor,isDarkMode:isDarkMode).getTheme(),
        routerConfig: appRouter);
        
        en este caso con theme : appTheme,

        apptheme sabe sus propiedades y en Riverpod que mantenga toda la clase de manera  que se detectan
        sus cambios y reaccionar basados en los cambios de una instancia de la clase nos permitira trabajar
        con metodos de clase o propiedades aparte de ser final y que los objetos sean inmutables como objetos.
        */

        /*
      home : HomeScreen(),
      Forma nativa de flutter de navegacion
      routes: {
        '/buttons' : (context) => const ButtonsScreen(),
        '/cards' : (context) => const CardsScreen()
      }
      */
        );
  }
}
