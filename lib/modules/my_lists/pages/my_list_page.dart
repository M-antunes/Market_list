import 'dart:math';

import 'package:flutter/material.dart';
import 'package:market_list/models/item/item.dart';
import 'package:market_list/models/list/buy_list.dart';
import 'package:market_list/modules/my_lists/pages/list_details_page.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';
import 'package:market_list/widgets/new_list_form.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  List<BuyList> buyList = BuyList.generateList();

  _addList(String name, String id) {
    final newList =
        BuyList(name: name, id: Random().nextDouble().toString(), items: [
      Item(name: 'Fim da Lista', quantity: 0, type: ''),
    ]);
    buyList.add(newList);

    setState(() {});
    Navigator.of(context).pop();
  }

  _removeItem(String id) {
    setState(() {
      buyList.removeWhere((it) => it.id == id);
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
                title: Text('Minhas Listas', style: AppTextStyles.title),
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
            SliverList(
              delegate: SliverChildBuilderDelegate((ctx, index) {
                final list = buyList[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ListDetailsPage(buyList: buyList[index])));
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      elevation: 5,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 3),
                              child: Text(buyList[index].name,
                                  style: AppTextStyles.subTitle),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close_rounded,
                                color: Colors.red[200], size: 20),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text('Excluir ${list.name}?'),
                                  actions: [
                                    TextButton(
                                      child: Text('Sim'),
                                      onPressed: () {
                                        _removeItem(list.id);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Não'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, childCount: buyList.length),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewListForm(onSubmit: _addList)));
          },
        ),
      ),
    );
  }
}
