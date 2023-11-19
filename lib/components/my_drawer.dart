import 'package:etrucky/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.fire_truck,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // inicio
              MyListTile(
                text: "Inicio",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // carrinho
              MyListTile(
                text: "Carrinho",
                icon: Icons.shopping_cart,
                onTap: () {
                  // primeiro fecha o menu
                  Navigator.pop(context);

                  // depois vai para o carrinho
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // sai do menu
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Sair",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
