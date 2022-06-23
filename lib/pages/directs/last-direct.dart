import 'dart:async';

import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:dvot_dashboard_init/pages/directs/DirectPlayer.dart';
import 'package:dvot_dashboard_init/pages/directs/settings/direct-settings.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:dvot_dashboard_init/widgets/buttons/button.dart';
import 'package:dvot_dashboard_init/widgets/page-title.dart';
import 'package:dvot_dashboard_init/widgets/spectators-number.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LatestDirect extends StatelessWidget {
  const LatestDirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: FutureBuilder(
        future: DirectsService.getLatestLive(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              final ApiResponse response = snapshot.data;
              if (!response.error) {
                Direct direct = Direct.fromJson(response.data[0]);
                String directId = direct.id ?? "0";
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: PageTitle(
                              "Direct: ${direct.title}",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      flex: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                          ),
                          Expanded(
                              child: PageTitle(
                                direct.author,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              flex: 4),
                          Expanded(
                            child: Icon(
                              Icons.visibility,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(
                            child: SpectatorsNumber(
                              directId: directId,
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DirectPlayer(direct),
                      ),
                      flex: 4,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(),
                              flex: 3,
                            ),
                            Expanded(
                              child: Button(
                                "Gérer",
                                onTap: () => Navigator.of(context).pushNamed(DirectSettings.routeName, arguments: direct),
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                );
              }
              break;
            default:
              return Container();
          }
          return const Center(
            child: Text("Aucun Direct en Live"),
          );
        },
      ),
    );
  }
}
