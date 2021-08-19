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
                  showContainerForm(
                      'Item', _titleController, TextInputType.name),
                  SizedBox(height: 10),
                  showContainerForm(
                      'Quantidade', _qntController, TextInputType.number),
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
                        });
                      },
                      items: _listOfTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type, style: AppTextStyles.formText),
                        );
                      }).toList()),
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

  showContainerForm(
      String label, TextEditingController cntrl, TextInputType keybord) {
    return Container(
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
          keyboardType: keybord,
          cursorHeight: 28,
          cursorWidth: 2,
          cursorColor: AppColors.primary,
          textCapitalization: TextCapitalization.words,
          controller: cntrl,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            labelStyle: AppTextStyles.formText,
          ),
        ),
      ),
    );
  }
}
