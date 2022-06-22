import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/dashboard/dashboard-live-content.dart';
import 'package:dvot_dashboard_init/pages/directs/DirectPlayer.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:dvot_dashboard_init/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../class/api-response.dart';

class DashboardLive extends StatelessWidget {
  const DashboardLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 15,
        child: FutureBuilder(
          future: DirectsService.getLatestLive(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                final ApiResponse response = snapshot.data;
                if (!response.error) {
                  Direct direct = Direct.fromJson(response.data[0]);
                  return Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: DirectPlayer(direct),
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: DashboardLiveContent(
                          direct: direct,
                        ),
                      ),
                    ],
                  );
                  // return DashboardLiveContent(
                  //   direct: direct,
                  // );
                }
                break;
              default:
                return Container();
                break;
            }
            return const Center(
              child: Text("Aucun Direct en Live"),
            );
          },
        ));
  }
}
