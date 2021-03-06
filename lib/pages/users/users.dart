import 'package:dvot_dashboard_init/pages/users/users-content.dart';
import 'package:flutter/material.dart';

import '../../widgets/sidebar/side-bar.dart';

class Users extends StatelessWidget {
  static const String routeName = "Utilisateurs";
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: const [
          Expanded(
            child: SideBar(
              routeName: Users.routeName,
            ),
            flex: 1,
          ),
          Expanded(
            child: UsersContent(),
            flex: 6,
          )
        ],
      ),
    );
  }
}
