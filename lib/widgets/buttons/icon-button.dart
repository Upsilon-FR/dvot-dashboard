import 'package:flutter/material.dart';

class DvotIconButton extends StatelessWidget {
  final double width;
  final double height;
  final Icon icon;
  final VoidCallback onTap;
  final Color color;

  const DvotIconButton(
    this.icon, {
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 15,
        color: color,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
