import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/add/direct-add.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-settings.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:flutter/material.dart';

class DirectDatatablesActions extends StatelessWidget {
  final Direct direct;
  final Function(Direct) onDeleteTap;

  const DirectDatatablesActions(
      {Key? key, required this.direct, required this.onDeleteTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: const Icon(Icons.settings),
          onTap: () async => Navigator.of(context).pushNamed(DirectSettings.routeName, arguments: direct),
        ),
        GestureDetector(
          child: const Icon(Icons.edit),
          onTap: () => Navigator.of(context).pushNamed(DirectAdd.routeName, arguments: direct),
        ),
        GestureDetector(
          child: const Icon(Icons.delete),
          onTap: () async => {
            await DirectsService.delete(direct.id ?? ""),
            onDeleteTap(direct),
          },
        ),
      ],
    );
  }
}
