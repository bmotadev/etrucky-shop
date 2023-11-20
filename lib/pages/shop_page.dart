import 'package:etrucky/components/my_drawer.dart';
import 'package:etrucky/components/my_vehicle_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // acesso dos veiculos no shop
    final vehicles = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Caminhões"),
        actions: [
          // vai para o botão do carrinho
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_checkout_outlined))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),

          // shop subtitle
          Center(
            child: Text(
              "Escolha seu novo caminhão.",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          // product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: vehicles.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // pega cada veiculo de forma individual
                final vehicle = vehicles[index];

                // retorna o veiculo
                return MyVehicleTile(vehicle: vehicle);
              },
            ),
          )
        ],
      ),
    );
  }
}
