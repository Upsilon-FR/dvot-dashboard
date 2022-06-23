import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/directs-player.dart';
import 'package:dvot_dashboard_init/pages/directs/directs.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-detail-container.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-settings-actions.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-settings.dart';
import 'package:flutter/material.dart';

class DirectSettingsContent extends StatelessWidget {
  final Direct? direct;

  const DirectSettingsContent({Key? key, this.direct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Parametres direct",
              style: Theme.of(context).textTheme.headline1,
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    Directs.routeName,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Text(
                  " > ",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  DirectSettings.routeName,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            flex: 1,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: DirectPlayer(direct!),
                      flex: 3,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DirectDetailContainer(
                        direct: direct,
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
            flex: 20,
          ),
        ],
      ),
    );
  }
}
