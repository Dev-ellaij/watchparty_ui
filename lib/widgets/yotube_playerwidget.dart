// widgets/youtube_player_widget.dart

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerWidget extends StatelessWidget {
  final YoutubePlayerController controller;
  final Color lilacColor;

  // ignore: use_super_parameters
  const YouTubePlayerWidget({
    Key? key,
    required this.controller,
    required this.lilacColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: lilacColor,
    );
  }
}
