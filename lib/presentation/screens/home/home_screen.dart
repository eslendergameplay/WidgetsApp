import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu-items/menu_item.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //si no esta en el tema se coloca en el AppBar centerTitle:true
        appBar: AppBar(title: const Text('Flutter + Material3.')),
        body: _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];
          /*
          Un widget especializado para listas y hay muchos tiles que veremos en una clase,una lista o se
          requiera con varios tiles.
          return ListTile(
              title: Text(menuItem.title), subtitle: Text(menuItem.subTitle));
          */
          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;
  //Opcional super.key al ser _privado si no se requiere
  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
        leading: Icon(menuItem.icon, color: colors.primary),
        title: Text(menuItem.title),
        subtitle: Text(menuItem.subTitle),
        //Trailing derecha en el listTile
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
        onTap: () {
          /*
          context lleva al arbol de widgets.
          Push crea un Stack como en Android con el que viene se coloca delante y luego pasa la siguiente
          y la anterior va atras y asi sucesivamente y flutter lo hace automaticamente y en 
          flutter las pantallas o paginas son llamadas rutas es un recordatorio de esta terminologia se refiere
          a esto y lo construye en tiempo de ejecucion.
          Colocando la pantalla y la otra en el Scaffold con < en buttonsScreen al saber que tiene un AppBar
          y sabe que hay un historial,enlace o puente para ir atras esto solo pasa con el push o pushNamed
          No se recomienda usar nombres de rutas para algunas aplicaciones pero eso se explicara mas adelante.
          Funcionan de igual manera los metodos nativos con go_router tambien.
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ButtonsScreen()));
          Navigator.of(context).pushNamed(context,menuItem.link)
          Navigator.of(context).replace(menuItem.link);
          Replace borra el anterior y lo reemplaza por lo que se borra el stack completo.
          context.pushNamed(menuItem.link);
          context.push(menuItem.link);
          context.go(menuItem.link);
          argumentos 
          context.go(Uri(path:'/path',queryParameters: {'filter':abc}).toString());
          context.goNamed('/buttons',params:{'color':123});
          nostros decidimos cual comando usar para navegar con go_route recordar los argumentos.
          Tambien en vez de ponerlo crudo el path se puede colocar el nombre en estatico y luego pasarlo
          context.pushNamed(CardsScreen.name);    
          */
          context.push(menuItem.link);
        });
  }
}
