import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/directs.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-settings-content.dart';
import 'package:dvot_dashboard_init/widgets/sidebar/side-bar.dart';
import 'package:flutter/material.dart';

class DirectSettings extends StatelessWidget {
  static const String routeName = "Parametres Direct";

  final Direct? direct;

  const DirectSettings({Key? key, this.direct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Row(
        children: [
          const Expanded(
            child: SideBar(
              routeName: Directs.routeName,
            ),
            flex: 1,
          ),
          Expanded(
            child: DirectSettingsContent(
              direct: direct,
            ),
            flex: 6,
          )
        ],
      ),
    );
  }
}
