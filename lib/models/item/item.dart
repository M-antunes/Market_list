class Item {
  final String? id;
  final String name;
  final int quantity;
  final String? price;
  final String type;
  bool selected;

  Item({
    this.id,
    required this.name,
    required this.quantity,
    this.price,
    required this.type,
    this.selected = false,
  });
}
