import 'package:flutter/material.dart';

class CustomDataCell extends StatelessWidget {
  final String text;

  const CustomDataCell(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
