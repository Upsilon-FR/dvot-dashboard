import 'package:dvot_dashboard_init/pages/dashboard/dashboard-content.dart';
import 'package:dvot_dashboard_init/widgets/sidebar/side-bar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const String routeName = "Dashboard";

  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: const [
          Expanded(
            child: SideBar(
              routeName: Dashboard.routeName,
            ),
            flex: 1,
          ),
          Expanded(
            child: DashboardContent(),
            flex: 6,
          )
        ],
      ),
    );
  }
}
