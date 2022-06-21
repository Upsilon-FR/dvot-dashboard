import 'package:flutter/material.dart';

class LoginFormInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool required;

  const LoginFormInput(
      {Key? key,
      required this.controller,
      required this.label,
      required this.required})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null) return value;
        if (required && value.isEmpty) {
          return '$label Oblicatoire';
        }
        return null;
      },
      controller: controller,
      obscureText: label == "Mot de passe",
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
