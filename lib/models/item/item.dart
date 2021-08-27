import 'dart:math';

class Item {
  String? id;
  String name;
  int quantity;
  String? price;
  String type;
  bool selected;

  Item({
    this.id,
    required this.name,
    required this.quantity,
    this.price,
    required this.type,
    this.selected = false,
  });

  static List<Item> generateList() {
    return [
      Item(
        id: Random().nextDouble().toString(),
        name: 'Arroz',
        quantity: 1,
        type: 'kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Açúcar',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Feijão',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Farinha',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Sal',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Macarrão',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Creme de Leite',
        quantity: 3,
        type: 'Pct',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Milho de Pipoca',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Batata',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Cebola',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Tomate',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Alho',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Arroz',
        quantity: 1,
        type: 'kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Açúcar',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Feijão',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Farinha',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Sal',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Macarrão',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Creme de Leite',
        quantity: 3,
        type: 'Pct',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Milho de Pipoca',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Batata',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Cebola',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Tomate',
        quantity: 1,
        type: 'Kg',
      ),
      Item(
        id: Random().nextDouble().toString(),
        name: 'Alho',
        quantity: 1,
        type: 'Kg',
      ),
    ];
  }
}
