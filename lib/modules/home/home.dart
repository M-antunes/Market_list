import 'dart:math';
import 'package:flutter/material.dart';
import 'package:market_list/models/item/item.dart';
import 'package:market_list/models/readied_list/readied_list.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';
import 'package:market_list/widgets/item_form.dart';
import 'package:market_list/widgets/list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> _items = [];
  final List<Item> _readiedList = ReadiedList.completeList;

  _addItem(String name, int quantity, String type) {
    final newItem = Item(
      id: Random().nextDouble().toString(),
      name: name,
      quantity: quantity,
      type: type,
    );
    setState(() {
      _items.add(newItem);
      _readiedList.add(newItem);
    });
    Navigator.of(context).pop();
  }

  _openItemFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ItemForm(_addItem),
    );
  }

  _removeItem(String id) {
    setState(() {
      _items.removeWhere((it) => it.id == id);
      _readiedList.removeWhere((it) => it.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text("Lista de Mercado", style: AppTextStyles.title),
          actions: [
            IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              // Container(
              //   margin: EdgeInsets.all(10),
              //   child: Padding(
              //     padding: EdgeInsets.only(bottom: 5),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Text('Qnt', style: AppTextStyles.subTitle),
              //         SizedBox(width: MediaQuery.of(context).size.width * 0.25),
              //         Text('Itens', style: AppTextStyles.subTitle),
              //       ],
              //     ),
              //   ),
              // ),
              ListOfItems(
                _readiedList,
                _removeItem,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primary,
            child: Icon(Icons.add),
            onPressed: () => _openItemFormModal(context)));
  }
}
