import 'package:etrucky/models/shop.dart';
import 'package:etrucky/models/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyVehicleTile extends StatelessWidget {
  final Vehicle vehicle;

  const MyVehicleTile({
    super.key,
    required this.vehicle,
  });

  // add to cart button pressed
  void addToCart(BuildContext context) {
    // caixa de dialogo pra confirmar o item a ser adicionado
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Adicionar item ao carrinho?"),
        actions: [
          // botao cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),

          MaterialButton(
            onPressed: () => {
              // caixa de dialogo
              Navigator.pop(context),

              // adiciona ao carrinho
              context.read<Shop>().addToCart(vehicle),
            },
            child: Text("Sim"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image do veiculo
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(vehicle.imagePath),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // nome do veiculo
              Text(
                vehicle.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              // descrição do veiculo
              Text(
                vehicle.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 25,
          ),

          // preço e botão de adicionar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // vehicle price
              Text(
                '\$' + vehicle.price.toStringAsFixed(2),
              ),
              // botao de adicionar ao carrinho
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
