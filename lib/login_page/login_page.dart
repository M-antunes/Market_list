import 'package:flutter/material.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          biuldTextForm(
            context,
            'Nome',
            Icon(Icons.person),
            TextInputType.name,
          ),
          biuldTextForm(
            context,
            'Email',
            Icon(Icons.email),
            TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          biuldTextForm(
            context,
            'Password',
            Icon(Icons.password),
            TextInputType.visiblePassword,
          ),
          SizedBox(height: 20),
          MaterialButton(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text('Cadastar', style: AppTextStyles.quantity),
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Align biuldTextForm(
      BuildContext context, String text, Widget icon, TextInputType inputText) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextFormField(
          cursorHeight: 28,
          keyboardType: inputText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            labelText: text,
            labelStyle: AppTextStyles.formText,
            icon: icon,
          ),
        ),
      ),
    );
  }
}
