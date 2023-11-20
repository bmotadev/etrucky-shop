import 'package:etrucky/components/my_button.dart';
import 'package:etrucky/models/shop.dart';
import 'package:etrucky/models/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // metodo para remover item do carrinho
  void removeItemFromCart(BuildContext context, Vehicle vehicle) {
    // mostra uma caixa de dialogo para confirmar o item a ser removido do carrinho
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remover item do carrinho?"),
        actions: [
          // botão de cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),

          // botão sim
          MaterialButton(
            onPressed: () {
              // caixa de dialogo
              Navigator.pop(context);

              // adiciona ao carrinho
              context.read<Shop>().removeFromCart(vehicle);
            },
            child: Text("Sim"),
          ),
        ],
      ),
    );
  }

  // metodo usuario pressionou botao de pagamento
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Carregando formas de pagamento..."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // acesso ao carrinho
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Carrinho"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // lista do carrinho
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text("Seu carrinho está vazio... :("),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // itens no carrinho
                      final item = cart[index];

                      // volta
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          // botão de pagamento
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("PAGAR"),
            ),
          ),
        ],
      ),
    );
  }
}
