import 'package:flutter/material.dart';
import 'package:market_list/modules/my_lists/pages/my_list_page.dart';

class MarketList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: MyListPage());
  }
}
