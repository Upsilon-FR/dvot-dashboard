import 'package:dvot_dashboard_init/widgets/sidebar/sidebar-element.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final String routeName;

  const SideBar({Key? key, this.routeName = "Dashboard"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Expanded(child: Image(image: AssetImage("sidebar-header.png"), height: 100,), flex: 1,),
          Expanded(
            child: Column(
              children: [
                SideBarElement(
                  icon: Icons.dashboard,
                  name: "Dashboard",
                  route: routeName,
                ),
                SideBarElement(
                  icon: Icons.person,
                  name: "Utilisateurs",
                  route: routeName,
                ),
                SideBarElement(
                  icon: Icons.class_outlined,
                  name: "Posts",
                  route: routeName,
                ),
                SideBarElement(
                  icon: Icons.adjust,
                  name: "Directs",
                  route: routeName,
                ),
              ],
            ),
            flex: 9,
          ),
          Expanded(
            child: SideBarElement(
              icon: Icons.exit_to_app,
              name: "Déconnexion",
              route: routeName,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
