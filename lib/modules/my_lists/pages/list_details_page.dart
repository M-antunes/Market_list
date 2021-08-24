import 'dart:math';

import 'package:flutter/material.dart';
import 'package:market_list/models/item/item.dart';

import 'package:market_list/models/list/buy_list.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';
import 'package:market_list/widgets/item_form.dart';
import 'package:market_list/widgets/list_of_items.dart';

class ListDetailsPage extends StatefulWidget {
  final BuyList buyList;

  const ListDetailsPage({
    required this.buyList,
  });

  @override
  _ListDetailsPageState createState() => _ListDetailsPageState();
}

class _ListDetailsPageState extends State<ListDetailsPage> {
  _addItem(String name, int quantity, String type, String id) {
    final newItem = Item(
      id: Random().nextDouble().toString(),
      name: name,
      quantity: quantity,
      type: type,
    );
    widget.buyList.items.add(newItem);

    setState(() {});
    Navigator.of(context).pop();
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
                title: Text(widget.buyList.name, style: AppTextStyles.title),
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
            ListOfItems(widget.buyList.items),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ItemForm(onSubmit: _addItem, id: widget.buyList.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
