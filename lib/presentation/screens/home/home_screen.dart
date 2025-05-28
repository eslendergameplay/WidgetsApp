import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu-items/menu_item.dart';
import 'package:widgets_app/presentation/widgets/drawers/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(key: scaffoldKey,
        appBar: AppBar(title: const Text('Flutter + Material3.')),
        body: _HomeView(),
        drawer: SideMenu(scaffoldKey:scaffoldKey),
    );
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
          
          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;
  
  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
        leading: Icon(menuItem.icon, color: colors.primary),
        title: Text(menuItem.title),
        subtitle: Text(menuItem.subTitle),
        
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
        onTap: () {
          
          context.push(menuItem.link);
        });
  }
}
