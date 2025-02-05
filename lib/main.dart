import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


void main() {
  runApp(const WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WidgetsApp.',
      debugShowCheckedModeBanner: false,
      theme:AppTheme(selectedColor:0).getTheme(),
      routerConfig: appRouter
      
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
