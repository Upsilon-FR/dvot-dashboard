import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddFormDateInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool required;

  const AddFormDateInput(
      {Key? key,
      required this.controller,
      required this.label,
      this.required = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 25,
      validator: (value) {
        if (value == null) return value;
        if (required && value.isEmpty) {
          return '$label Oblicatoire';
        }
        return null;
      },
      onTap: () async {

        FocusScope.of(context).requestFocus(FocusNode());
        DateTime? date = DateTime.now();
        date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));
        controller.text = DateFormat("dd/MM/yyyy").format(date!);
      },
      controller: controller,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor: Theme.of(context).cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: required ? label + "*" : label,
      ),
    );
  }
}
