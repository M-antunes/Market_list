import 'package:flutter/material.dart';
import 'package:market_list/models/item/item.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';

class ListOfItems extends StatefulWidget {
  final List<Item> items;
  final void Function(String) onRemove;

  const ListOfItems(
    this.items,
    this.onRemove,
  );

  @override
  _ListOfItemsState createState() => _ListOfItemsState();
}

var qnt;
List<bool> _selected = List.generate(qnt, (i) => false);

class _ListOfItemsState extends State<ListOfItems> {
  Widget build(BuildContext context) {
    qnt = widget.items.length.toInt();
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        controller: ScrollController(),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 50),
        itemCount: widget.items.length,
        itemBuilder: (ctx, index) {
          final it = widget.items[index];
          return MaterialButton(
            child: Card(
              color: _selected[index] ? AppColors.primary : Colors.white,
              elevation: _selected[index] ? 0 : 10,
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: _selected[index] ? 4 : 0,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1.5,
                      color:
                          _selected[index] ? Colors.white : AppColors.primary,
                    )),
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${it.quantity.toString()}',
                            style: _selected[index]
                                ? AppTextStyles.quantityOnSelected
                                : AppTextStyles.quantity),
                        Text('${it.type}',
                            style: _selected[index]
                                ? AppTextStyles.typeDescriptionOnSelected
                                : AppTextStyles.typeDescription),
                      ],
                    ),
                  ),
                  SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      it.name,
                      style: _selected[index]
                          ? AppTextStyles.itemsOnSelected
                          : AppTextStyles.items,
                    ),
                  ),
                  Container(
                      child: IconButton(
                    icon: Icon(Icons.close_rounded,
                        color: Colors.red[200], size: 20),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Excluir ${it.name}?'),
                          actions: [
                            TextButton(
                              child: Text('Sim'),
                              onPressed: () {
                                widget.onRemove(it.id!);
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
                  ))
                ],
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(_selected[index]
                      ? 'Desmarcar ${it.name}?'
                      : 'Marcar ${it.name} como Adicionado?'),
                  actions: [
                    TextButton(
                      child: Text('Sim'),
                      onPressed: () {
                        setState(() {
                          _selected[index] = !_selected[index];
                        });
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
          );
        },
      ),
    );
  }

  showIconButton(
      BuildContext context, Widget icon, Widget textButton, String text) {
    return IconButton(
      icon: icon,
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(text),
            actions: [
              textButton,
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
    );
  }
}
