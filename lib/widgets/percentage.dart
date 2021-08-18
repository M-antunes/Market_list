import 'package:flutter/material.dart';
import 'package:market_list/models/item/item.dart';

import 'package:market_list/themes/app_text_styles.dart';
import 'package:market_list/widgets/percentage_bar.dart';

class Percent extends StatelessWidget {
  final List<Item> countingForPercent;
  Percent(this.countingForPercent);

  _percentCount() {
    double itemCount = 0;
    for (var i = 0; i < countingForPercent.length; i++) {
      if (countingForPercent[i].selected == true) {
        itemCount++;
      }
    }
    return itemCount / countingForPercent.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Column(
        children: [
          Text('Sua lista está ', style: AppTextStyles.formText),
          PercentageBar(percentage: _percentCount()),
          Text(' completa', style: AppTextStyles.formText),
        ],
      ),
    );
  }
}
