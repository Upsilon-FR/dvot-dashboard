import 'package:flutter/material.dart';

class SideBarElement extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;

  SideBarElement({Key? key, required this.name, required this.route, required this.icon})
      : super(key: key);

  late bool isSelected;

  @override
  Widget build(BuildContext context) {
    isSelected = name == route;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 15,),
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 20,),
              Text(
                name,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
