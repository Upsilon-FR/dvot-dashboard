import 'dart:html';

import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-settings.dart';
import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:flutter/material.dart';

class DashboardLiveContent extends StatelessWidget {
  final Direct direct;

  const DashboardLiveContent({Key? key, required this.direct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "Direct : ${direct.title}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            flex: 3,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Button(
                "Gérer",
                onTap: () => Navigator.of(context)
                    .pushNamed(DirectSettings.routeName, arguments: direct),
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
