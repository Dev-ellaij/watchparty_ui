// widgets/video_info_widget.dart

import 'dart:ui_web';

import 'package:first_try/ui/youtube_player_screen.dart';
import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoInfoWidget extends StatelessWidget {
  final Video video;
  final Color lilacColor;

  // ignore: use_super_parameters
  const VideoInfoWidget({
    Key? key,
    required this.video,
    required this.lilacColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style: TextStyle(
              color: lilacColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${video.views} • ${video.uploadTime}",
            style: TextStyle(color: lilacColor.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}
