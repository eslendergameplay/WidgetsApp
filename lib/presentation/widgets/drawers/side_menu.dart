import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu-items/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  /*
  Se puede usar un gestor de estado para tener la ultima posicion seleccionada usandolo se coloca y nos permite
  saber la distancia de los menus ya que al quitarse se llama al dispose y por eso no matiene el estado
  al ser una variable normal y destruirse y construirse constantemente.
  Y permitira saber en que opcion esta seleccionada y aplicar un estilo o comportamiento basado en eso.
  */
  int navDrawerIndex = 0;
  _SideMenuState();

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    /* Para saber los tamanos y espacios del notch desde arriba con
    final hasNotch = MediaQuery.of(context).viewPadding.top;
    if (Platform.isAndroid) {
      print('Android $hasNotch');
    } else {
      print('Ios $hasNotch');
    }
    Para acceder desde las propiedades del widget Stateful desde el State se hace asi
    widget.porperty
    */

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          //O Navigator.of(context).push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(padding: EdgeInsets.fromLTRB(28,hasNotch ? 5 : 20,16,10),child: Text('Main.')),
          /*
          NavigationDrawerDestination(icon:Icon(Icons.add),label:const Text('Home Screen.'));
          NavigationDrawerDestination(icon:const Icon(Icons.add_shopping_cart_rounded),label:
          const Text('Otra Pantalla.'));
          ...appMenuItems.map((item) => NavigationDrawerDestination(icon: Icon(item.icon),
          label: Text(item.title)))
          */
           ...appMenuItems.sublist(0,3).map((item)=> NavigationDrawerDestination(
             icon:Icon(item.icon),label: Text(item.title))),
           const Padding(padding: EdgeInsets.fromLTRB(28,16,28,10),child: Divider()),
           const Padding(padding:EdgeInsets.fromLTRB(28,10,16,10),child: Text('More Options :')),

           ...appMenuItems.sublist(3).map((item)=> NavigationDrawerDestination(icon: Icon(item.icon),
            label: Text(item.title))),  
            /*
            Se debe saber que un dispositivo con un notch o espacio con camara frontal y sensores tienen
            un espacio no renderizable en el nos da flutter que controla sobre el pixel 0 y da acceso a todo,
            tenemos saber que,hay muchos widgets donde se sabe que esos widgets no se renderizan widgets en
            el notch y no lo coloca y en otras pantallas el menu aparecera muy arriba pegado y correrlo en un
            dispositivo android de manera normal y se corre puede haber casos como hacer un menu mas bonito
            con un par de opciones de textos.
            Y colocar y ordenarse junto desde el comienzo y se debe considerar ya que en el dispositivo
            sin notch se puede ver bien pero en el tiene notch no se veria bien y no le gustaria al usuario
            final o consumidor o el que utilizara la aplicacion normalmente ya que ese espacio si tiene notch
            no se rendirizaria igual como si no lo tuviera.
            */
        ]);
  }
}
