import 'package:dvot_dashboard_init/pages/directs/settings/go-live-button.dart';
import 'package:dvot_dashboard_init/widgets/buttons/button.dart';
import 'package:dvot_dashboard_init/widgets/buttons/icon-button.dart';
import 'package:dvot_dashboard_init/widgets/spectators-number.dart';
import 'package:flutter/material.dart';
import 'dart:html';

import '../../../class/direct.dart';

class DirectSettingsActions extends StatefulWidget {
  final Direct? direct;

  const DirectSettingsActions({Key? key, this.direct}) : super(key: key);

  @override
  State<DirectSettingsActions> createState() => _DirectSettingsActionsState();
}

class _DirectSettingsActionsState extends State<DirectSettingsActions> {
  Direct? get direct => widget.direct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DvotIconButton(
            const Icon(
              Icons.link_sharp,
              color: Colors.white,
              size: 25,
            ),
            color: Colors.grey,
            onTap: () => window.open(direct?.link ?? "", "_blank"),
          ),
          flex: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GoLiveButton(id: direct?.id ?? ""),
          flex: 2,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
