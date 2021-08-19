import 'dart:math';
import 'package:flutter/material.dart';
import 'package:market_list/models/item/item.dart';
import 'package:market_list/models/readied_list/readied_list.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';
import 'package:market_list/widgets/item_form.dart';
import 'package:market_list/widgets/list_of_items.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
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

  _removeItem(String id) {
    setState(() {
      _items.removeWhere((it) => it.id == id);
      _readiedList.removeWhere((it) => it.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.primary,
              floating: false,
              stretch: true,
              // pinned: true,
              // snap: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                title: Text('Lista de Mercado', style: AppTextStyles.title),
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          AppColors.primary,
                          Colors.transparent,
                        ]),
                  ),
                  child: Image.network(
                      'https://i4.hurimg.com/i/hurriyet/75/0x0/60add0044e3fe00214d68b81.jpg',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            ListOfItems(_readiedList, _removeItem),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemForm(_addItem),
              ),
            );
          },
        ),
      ),
    );
  }
}
