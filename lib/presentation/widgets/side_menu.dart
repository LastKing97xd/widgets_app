import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    // si el viewpadding es mayor a 35 le asigna el valor
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      //cambia el resaltado de color que tiene
      selectedIndex: navDrawerIndex,
      //donde selecciono tiene un valor y eso pasa arriba
      onDestinationSelected: (value) {

        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];

        context.push(menuItem.link);
        //para llamar dentro de statefull es con widget
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Valida Notch'),
        ),

        //en vez de pasar la lista completa como un solo argumento, estás pasando cada elemento de esa lista como un argumento separado
        ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          )
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider()
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('More Options'),
        ),
        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          )
        ),

        // const NavigationDrawerDestination(
        //   icon: Icon(Icons.add), 
        //   label: Text('Home Screen')
        // ),
        // const NavigationDrawerDestination(
        //   icon: Icon(Icons.add_shopping_cart_outlined), 
        //   label: Text('Home Screen 2')
        // ),

      ],
    );
  }
}