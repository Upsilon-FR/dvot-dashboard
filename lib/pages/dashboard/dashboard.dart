import 'package:dvot_dashboard_init/widgets/sidebar/side-bar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static String routeName = "Dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SideBar(
            routeName: Dashboard.routeName,
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
