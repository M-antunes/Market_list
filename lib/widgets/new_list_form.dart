import 'dart:math';

import 'package:flutter/material.dart';

import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';

class NewListForm extends StatefulWidget {
  final void Function(String, String) onSubmit;
  NewListForm({
    required this.onSubmit,
  });

  @override
  _NewListFormState createState() => _NewListFormState();
}

class _NewListFormState extends State<NewListForm> {
  final _titleController = TextEditingController();

  _submitForm() {
    final name = _titleController.text;
    final id = Random().nextDouble().toString();
    if (name.isEmpty) {
      return;
    }
    widget.onSubmit(name, id);
  }

  @override
  Widget build(BuildContext context) {
    final boxSizes = MediaQuery.of(context).size;
    final keybordSize = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.only(
              top: 10, left: 10, right: 10, bottom: keybordSize),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: boxSizes.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 60,
                    width: 250,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        cursorHeight: 28,
                        cursorWidth: 2,
                        cursorColor: AppColors.primary,
                        textCapitalization: TextCapitalization.words,
                        controller: _titleController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Nome da Lista',
                          labelStyle: AppTextStyles.formText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                        child: Text(
                          'Adicionar',
                          style: AppTextStyles.subTitle,
                        ),
                      ),
                    ),
                    onPressed: () {
                      _submitForm();
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
