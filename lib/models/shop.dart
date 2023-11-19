import 'package:etrucky/models/vehicle.dart';

class Shop {
  // produtos para venda
  final List<Vehicle> _shop = [
    // veiculo 1
    Vehicle(
      name: "Caminhão 1",
      price: 32.000,
      description: "Descrição do veiculo",
    ),
    // veiculo 2
    Vehicle(
      name: "Caminhão 2",
      price: 25.000,
      description: "descrição do veiculo",
    ),
    // veiculo 3
    Vehicle(
      name: "Caminhão 3",
      price: 27.000,
      description: "descrição do veiculo",
    ),
    // veiculo 4
    Vehicle(
      name: "Caminhão 4",
      price: 45.000,
      description: "descrição do veiculo",
    ),
  ];

  // carrinho do usuario
  List<Vehicle> _cart = [];

  // info lista de produto
  List<Vehicle> get shop => _shop;

  // info carrinho do usuario
  List<Vehicle> get cart => _cart;

  // adicionar item no carrinho
  void addToCart(Vehicle item) {
    _cart.add(item);
  }

  // remover item do carrinho
  void removeFromCart(Vehicle item) {
    _cart.remove(item);
  }
}
