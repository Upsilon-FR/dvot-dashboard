import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/add/direct-add-content.dart';
import 'package:dvot_dashboard_init/pages/directs/directs.dart';
import 'package:dvot_dashboard_init/widgets/sidebar/side-bar.dart';
import 'package:flutter/material.dart';

class DirectAdd extends StatelessWidget {
  static const routeName = "Ajout Direct";
  final Direct? direct;

  const DirectAdd({Key? key, required this.direct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child:Row(
          children: [
            const Expanded(
              child: SideBar(
                routeName: Directs.routeName,
              ),
              flex: 1,
            ),
            Expanded(
              child: DirectAddContent(
                direct: direct,
              ),
              flex: 6,
            )
          ],
        ),
      ),
    );
  }
}
