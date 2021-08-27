import 'package:flutter/material.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          biuldTextForm(
            context,
            'Nome',
            Icons.person,
            TextInputType.name,
            SizedBox(
              width: 1,
            ),
            false,
          ),
          SizedBox(height: 10),
          biuldTextForm(
            context,
            'Email',
            Icons.email,
            TextInputType.emailAddress,
            SizedBox(
              width: 1,
            ),
            false,
          ),
          SizedBox(height: 10),
          biuldTextForm(
            context,
            'Password',
            Icons.lock,
            TextInputType.visiblePassword,
            InkWell(
              child: isPasswordVisible
                  ? Icon(Icons.visibility_off_outlined, size: 28)
                  : Icon(Icons.visibility_outlined, size: 28),
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            isPasswordVisible ? false : true,
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

  Align biuldTextForm(BuildContext context, String text, IconData icon,
      TextInputType inputText, Widget sufIcon, bool hidePassword) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextFormField(
          obscureText: hidePassword,
          cursorHeight: 28,
          keyboardType: inputText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            labelText: text,
            labelStyle: AppTextStyles.formText,
            icon: Icon(icon, size: 28),
            suffixIcon: sufIcon,
          ),
          style: AppTextStyles.formText,
        ),
      ),
    );
  }
}
