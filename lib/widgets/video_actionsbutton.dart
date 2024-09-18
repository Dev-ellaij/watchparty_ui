// widgets/video_action_buttons.dart

import 'package:flutter/material.dart';

class VideoActionButtons extends StatelessWidget {
  final Color lilacColor;

  // ignore: use_super_parameters
  const VideoActionButtons({Key? key, required this.lilacColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconTextButton(Icons.thumb_up, "Like", lilacColor),
          _buildIconTextButton(Icons.thumb_down, "Dislike", lilacColor),
          _buildIconTextButton(Icons.share, "Share", lilacColor),
          _buildIconTextButton(Icons.download, "Download", lilacColor),
          _buildIconTextButton(Icons.playlist_add, "Save", lilacColor),
        ],
      ),
    );
  }

  Widget _buildIconTextButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ],
    );
  }
}
