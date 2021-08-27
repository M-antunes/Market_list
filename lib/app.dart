import 'package:flutter/material.dart';
import 'package:market_list/login_page/login_page.dart';
import 'package:market_list/modules/my_lists/pages/my_list_page.dart';
import 'package:market_list/themes/app_colors.dart';

class MarketList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          primarySwatch: MaterialColor(0xff97BF62, AppColors.primaryOriginal),
        ),
        home: MyListPage());
  }
}
