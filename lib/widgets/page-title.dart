import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  const PageTitle(this.title, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? Theme.of(context).textTheme.headline1,
    );
  }
}
