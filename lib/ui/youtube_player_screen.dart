import 'package:first_try/widgets/channel_infowidgets.dart';
import 'package:first_try/widgets/video_actionsbutton.dart';
import 'package:first_try/widgets/video_infowidgets.dart';
import 'package:first_try/widgets/yotube_playerwidget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/video_model.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final Video video;

  // ignore: use_super_parameters
  const YouTubePlayerScreen({Key? key, required this.video}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  final Color lilacColor = const Color(0xFFC8A2C8);
  final Color whiteColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.videoId,
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
          ChannelInfoWidget(video: widget.video),
        ],
      ),
    );
  }
}
