import 'package:flutter/material.dart';
import 'package:market_list/models/item/item.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';
import 'package:market_list/widgets/percentage_bar.dart';

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

// late int qnt;

// List<bool> it.selected.generate(qnt, (i) => false);
// _countingPercentage() {
//   var itemCount = 0.0;
//   for (var i = 0; i < _selected.length; i++) {
//     if (_selected[i] == true) {
//       itemCount++;
//     }
//   }
//   return itemCount / _selected.length;
// }

class _ListOfItemsState extends State<ListOfItems> {
  Widget build(BuildContext context) {
    // qnt = widget.items.length.toInt();
    var lastItem = widget.items.last;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          final it = widget.items[index];
          return MaterialButton(
            child: Padding(
              padding: lastItem.id == it.id
                  ? EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.1)
                  : EdgeInsets.all(0),
              child: Card(
                color: it.selected ? AppColors.primary : Colors.white,
                elevation: it.selected ? 0 : 10,
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: it.selected ? 4 : 0,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: it.selected ? Colors.white : AppColors.primary,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${it.quantity.toString()}',
                              style: it.selected
                                  ? AppTextStyles.quantityOnSelected
                                  : AppTextStyles.quantity),
                          Text('${it.type}',
                              style: it.selected
                                  ? AppTextStyles.typeDescriptionOnSelected
                                  : AppTextStyles.typeDescription),
                        ],
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        it.name,
                        style: it.selected
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(it.selected
                      ? 'Desmarcar ${it.name}?'
                      : 'Marcar ${it.name} como Adicionado?'),
                  actions: [
                    TextButton(
                      child: Text('Sim'),
                      onPressed: () {
                        setState(() {
                          it.selected = !it.selected;
                        });

                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Row(
                              children: [
                                // Text('Sua lista está ',
                                //     style: AppTextStyles.formText),
                                // PercentageBar(
                                //     percentage: _countingPercentage()),
                                // Text(' completa',
                                //     style: AppTextStyles.formText),
                              ],
                            ),
                          ),
                        );
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
        childCount: widget.items.length,
      ),
    );
  }

  // showIconButton(
  //     BuildContext context, Widget icon, Widget textButton, String text) {
  //   return IconButton(
  //     icon: icon,
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (ctx) => AlertDialog(
  //           title: Text(text),
  //           actions: [
  //             textButton,
  //             TextButton(
  //               child: Text('Não'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

}
