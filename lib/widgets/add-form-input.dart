import 'package:flutter/material.dart';

class AddFormInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool required;
  const AddFormInput({Key? key, required this.controller, required this.label, this.required = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: label == "Description" ? 25 : 1,
      validator: (value) {
        if (value == null) return value;
        if (required && value.isEmpty) {
          return '$label Oblicatoire';
        }
        return null;
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
