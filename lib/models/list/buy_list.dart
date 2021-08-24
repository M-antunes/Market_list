import 'dart:math';

import 'package:market_list/models/item/item.dart';

class BuyList {
  String id;
  String name;
  List<Item> items;

  BuyList({
    required this.id,
    required this.name,
    this.items = const [],
  });

  static List<BuyList> generateList() {
    return [
      BuyList(
        id: Random().nextDouble().toString(),
        name: 'Lista pré pronta',
        items: Item.generateList(),
      ),
      BuyList(
        id: Random().nextDouble().toString(),
        name: 'Lista pré pronta',
        items: Item.generateList(),
      ),
      BuyList(
        id: Random().nextDouble().toString(),
        name: 'Lista pré pronta',
        items: Item.generateList(),
      ),
      BuyList(
        id: Random().nextDouble().toString(),
        name: 'Lista pré pronta',
        items: Item.generateList(),
      ),
    ];
  }
}
