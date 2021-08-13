import 'package:flutter/material.dart';
import 'package:market_list/themes/app_colors.dart';
import 'package:market_list/themes/app_text_styles.dart';

class ItemForm extends StatefulWidget {
  final void Function(String, int, String) onSubmit;

  ItemForm(this.onSubmit);

  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _titleController = TextEditingController();
  final _qntController = TextEditingController();

  _submitForm() {
    final name = _titleController.text;
    final quantity = int.tryParse(_qntController.text) ?? 0;
    final type = typeSelected;

    if (name.isEmpty || quantity <= 0) {
      return;
    }
    widget.onSubmit(name, quantity, type);
  }

  List<String> _listOfTypes = [
    'Und',
    'Kg',
    'Lt',
    'Cx',
    'Pct',
  ];
  var typeSelected;

  @override
  Widget build(BuildContext context) {
    final keybordSize = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Card(
        elevation: 6,
        margin:
            EdgeInsets.only(top: 10, left: 10, right: 10, bottom: keybordSize),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Item',
                      labelStyle: AppTextStyles.formText,
                    ),
                    onSubmitted: (_) => _submitForm(),
                  ),
                ),
                Container(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _qntController,
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                      labelStyle: AppTextStyles.formText,
                    ),
                    onSubmitted: (_) => _submitForm(),
                  ),
                ),
                SizedBox(height: 10),
                DropdownButton(
                    hint: Text(
                      'Selecione um tipo.',
                      style: AppTextStyles.formText,
                    ),
                    value: typeSelected,
                    onChanged: (newValue) {
                      setState(() {
                        typeSelected = newValue;
                        _submitForm();
                      });
                    },
                    items: _listOfTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type, style: AppTextStyles.formText),
                      );
                    }).toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
