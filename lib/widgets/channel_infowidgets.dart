// screens/channel_info_widget.dart

import 'package:flutter/material.dart';
import '../models/video_model.dart';

class ChannelInfoWidget extends StatelessWidget {
  final Video video;

  // ignore: use_super_parameters
  const ChannelInfoWidget({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final Color lilacColor = const Color(0xFFC8A2C8);
    // ignore: prefer_const_declarations
    final Color whiteColor = Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: lilacColor.withOpacity(0.6),
            child: Icon(Icons.person, color: whiteColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              video.channelName,
              style: TextStyle(
                color: lilacColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: lilacColor),
            child: Text("Subscribe", style: TextStyle(color: whiteColor)),
          ),
        ],
      ),
    );
  }
}
