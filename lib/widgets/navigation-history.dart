import 'package:flutter/material.dart';

class PageNavigationHistory extends StatelessWidget {
  final String first;
  final String second;
  const PageNavigationHistory({
    Key? key, required this.first, required this.second,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Text(
            first,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Text(
          "> ",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          second,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}