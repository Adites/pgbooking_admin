import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:get/get.dart';

class DropDownBtn extends StatelessWidget {
  final List<String> items;
  final String selectedItemText;
  final String? selectedValue;
  final Function(String?) OnSelected;
  const DropDownBtn(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.selectedItemText,
      // required Null Function(dynamic selectedValue) onSelected,
      required this.OnSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            selectedItemText,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            OnSelected(value);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    ));
  }
}
