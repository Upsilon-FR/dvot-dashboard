import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  final Function(String) onChange;
  final String label;
  final String value;

  const CustomDropdown({Key? key, required this.list, required this.onChange, required this.label, required this.value}) : super(key: key);

  List<DropdownMenuItem<Object>> dropdownMenu() {
    return list
        .map((element) => DropdownMenuItem(
              child: Text(element["text"]),
              value: element["value"],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items: dropdownMenu(),
      onChanged: (Object? value) {
        onChange(value.toString());
      },
      decoration: InputDecoration(
        fillColor: Theme.of(context).cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
      ),
    );
  }
}
