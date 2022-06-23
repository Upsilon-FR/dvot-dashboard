import 'package:dvot_dashboard_init/class/direct.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DirectPlayer extends StatelessWidget {
  final Direct direct;

  DirectPlayer(this.direct, {Key? key}) : super(key: key);

  late final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    controller = YoutubePlayerController(
      initialVideoId: direct.link.split("/")[3],
      params: const YoutubePlayerParams(
        enableCaption: false,
      ),
    );

    return YoutubePlayerIFrame(
      controller: controller,
    );
  }
}
