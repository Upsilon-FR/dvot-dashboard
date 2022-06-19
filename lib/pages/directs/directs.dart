import 'package:dvot_dashboard_init/pages/directs/directs-content.dart';
import 'package:flutter/material.dart';

import '../../widgets/sidebar/side-bar.dart';

class Directs extends StatelessWidget {
  static const String routeName = "Directs";

  const Directs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: const [
          Expanded(
            child: SideBar(
              routeName: routeName,
            ),
            flex: 1,
          ),
          Expanded(
            child: DirectsContent(),
            flex: 6,
          )
        ],
      ),
    );
  }
}
