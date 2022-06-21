import 'dart:async';

import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:dvot_dashboard_init/widgets/page-title.dart';
import 'package:flutter/material.dart';

class SpectatorsNumber extends StatefulWidget {
  final String directId;

  const SpectatorsNumber({Key? key, required this.directId}) : super(key: key);

  @override
  State<SpectatorsNumber> createState() => _SpectatorsNumberState();
}

class _SpectatorsNumberState extends State<SpectatorsNumber> {
  String get directId => widget.directId;

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 30), (Timer t) => setState(() {}));
    return FutureBuilder(
      future: DirectsService.getSpectatorsById(directId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            final ApiResponse response = snapshot.data;
            if (!response.error) {
              int spectators = response.data[0]["spectateurs"] as int;
              return PageTitle(
                "$spectators",
                style: Theme.of(context).textTheme.subtitle1,
              );
            }
            break;
          default:
            return Container();
            break;
        }
        return Container();
      },
    );
  }
}
