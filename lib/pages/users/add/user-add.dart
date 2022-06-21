import 'package:dvot_dashboard_init/class/user.dart';
import 'package:dvot_dashboard_init/pages/users/add/user-add-content.dart';
import 'package:dvot_dashboard_init/pages/users/users.dart';
import 'package:dvot_dashboard_init/widgets/sidebar/side-bar.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  static const routeName = "Ajout Utilisateur";
  final User? user;

  const AddUser({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: [
          const Expanded(
            child: SideBar(
              routeName: Users.routeName,
            ),
            flex: 1,
          ),
          Expanded(
            child: AddUserContent(
              user: user,
            ),
            flex: 6,
          )
        ],
      ),
    );
  }
}
