import 'package:flutter/material.dart';

const appMenuItems = <MenuItem>[
  MenuItem(title:'Riverpod Counter.',subTitle:'Introduccion a Riverpod.',link:'/counter_river',icon:
  Icons.add),
  MenuItem(title:'Botones',subTitle:'Varios Botones en flutter.',link:'/buttons',
  icon: Icons.smart_button_outlined),
  MenuItem(title:'Tarjetas',subTitle:'Un contenedor estilizado o con caracteristicas especificas.',
  link:'/cards',icon: Icons.credit_card),
  MenuItem(title:'Progress Indicator.',subTitle:'Generales y controlados.',
  link:'/progress',icon:Icons.refresh_rounded),
  MenuItem(title:'SnackBars y dialogos.',subTitle:'Indicadores en pantalla',
  link:'/snackbars',icon: Icons.info_outline),
  MenuItem(title:'Animated Container.',subTitle:'Stateful Widget animado.',
  link:'/animated',icon: Icons.check_box_outline_blank_rounded),
  MenuItem(title:'UI Controls + Tiles.',subTitle:'Una serie de controles de flutter.',
  link:'/ui-controls',icon:Icons.car_rental_outlined),
  MenuItem(title:'Introduccion a la aplicacion.',subTitle:'Pequeño tutorial de la aplicacion o introduccion.',
  link:'/tutorial',icon:Icons.accessible_rounded),
  MenuItem(title:'Infinite Scroll y Pull To Refresh.',subTitle:'Listas infinitas y Pull To Refresh',
  link:'/infinite',icon: Icons.list_alt_rounded),
  MenuItem(title:'Cambiar Tema.',subTitle:'Cambiar tema de la aplicacion.',link:'/theme-changer',
  icon:Icons.color_lens_outlined)
];

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}
