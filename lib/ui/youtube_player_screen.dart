import 'package:flutter/material.dart';
import 'package:watchparty_ui/widgets/channel_infowidgets.dart';
import 'package:watchparty_ui/widgets/video_actionsbutton.dart';
import 'package:watchparty_ui/widgets/video_infowidgets.dart';
import 'package:watchparty_ui/widgets/yotube_playerwidget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video {
  final String videoId;
  final String title;
  final DateTime uploadTime;
  final int views;
  final String channelName;

  Video({
    required this.videoId,
    required this.title,
    required this.uploadTime,
    required this.views,
    required this.channelName,
  });
}

class YouTubePlayerScreen extends StatefulWidget {
  final Video video;

  const YouTubePlayerScreen({super.key, required this.video});

  @override
  // ignore: library_private_types_in_public_api
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  final Color lilacColor = const Color(0xFFC8A2C8);
  final Color whiteColor = const Color.fromARGB(255, 36, 27, 36);

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          widget.video.videoId, // Ensure this is a valid non-null string
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: lilacColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Now Playing",
              style: TextStyle(color: lilacColor, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          YouTubePlayerWidget(controller: _controller, lilacColor: lilacColor),
          VideoInfoWidget(video: widget.video, lilacColor: lilacColor),
          VideoActionButtons(lilacColor: lilacColor),
          // Pass the full video object here
          ChannelInfoWidget(
              video: widget.video), // No need for extra channelName parameter
        ],
      ),
    );
  }
}
