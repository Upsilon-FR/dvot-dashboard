import 'dart:convert';
import 'dart:html';

import 'package:dvot_dashboard_init/class/api-response.dart';
import 'package:dvot_dashboard_init/class/custom-toast.dart';
import 'package:dvot_dashboard_init/services/api/directs-service.dart';
import 'package:dvot_dashboard_init/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

import '../../../class/direct.dart';

class GoLiveButton extends StatefulWidget {
  final String id;

  GoLiveButton({Key? key, required this.id}) : super(key: key);

  @override
  State<GoLiveButton> createState() => _GoLiveButtonState();
}

class _GoLiveButtonState extends State<GoLiveButton> {
  String get id => widget.id;

  update() {
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DirectsService.getLiveById(id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container();
            break;
          case ConnectionState.done:
            final ApiResponse response = snapshot.data;
            if (!response.error) {
              bool live = response.data[0]["live"] as bool;
              String text;
              Color color;
              String message;
              if (live) {
                text = "Terminer le live";
                color = Colors.red;
                message = "Fin du live";
              } else {
                text = "Commencer le live";
                color = Theme.of(context).primaryColor;
                message = "Début du live";
              }
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: Button(text, onTap: () async {
                  ApiResponse response =
                      await DirectsService.updateLive(id, !live);
                  if (!response.error) {
                    CustomToast.showSuccessToast(msg: message, context: context);
                    update();
                  } else {
                    CustomToast.showErrorToast(
                        msg: "Opération Impossible, veuillez réessayer plus tard",
                        context: context);
                  }
                }, color: color),
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
