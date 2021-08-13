import 'package:flutter/material.dart';
import 'package:market_list/models/language/language.dart';
import 'package:market_list/modules/home/home.dart';

class LanguageChoice extends StatelessWidget {
  const LanguageChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                child: Image.asset(
                  'lib/assets/images/usa.png',
                  height: 100,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              MaterialButton(
                child: Image.asset(
                  'lib/assets/images/brazil.png',
                  width: 102,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
