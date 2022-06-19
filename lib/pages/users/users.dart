import 'package:flutter/material.dart';

import '../../widgets/sidebar/side-bar.dart';

class Users extends StatelessWidget {
  static String routeName = "Utilisateurs";
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SideBar(
            routeName: Users.routeName,
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: const Center(child: Text('Dashboard')),
          ),
          flex: 6,
        )
      ],
    );
  }
}
