import 'package:first_try/page/callpage.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:first_try/ui/chatscreen_page.dart';
import 'package:first_try/ui/profilepage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color lilacColor = const Color(0xFFC8A2C8);
  final Color whiteColor = Colors.white;

  List<dynamic> videos = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    try {
      YouTubeService youtubeService = YouTubeService();
      List<dynamic> fetchedVideos = await youtubeService.fetchVideos();
      setState(() {
        videos = fetchedVideos;
      });
    } catch (e) {
      print('Error fetching videos: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break; // Already on HomeScreen
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CallPage(videoId: '', callId: '')),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
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
            Expanded(
              child: Text(
                'Just Us Girls GLOBAL',
                style: TextStyle(color: lilacColor),
              ),
            ),
            Icon(
              Icons.search,
              color: lilacColor,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('All shows', style: TextStyle(color: lilacColor)),
                const SizedBox(width: 10),
                Text('YouTube', style: TextStyle(color: lilacColor)),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text('Live Stream', style: TextStyle(color: lilacColor)),
                    const SizedBox(width: 5),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: lilacColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: videos.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        var video = videos[index];
                        return ListTile(
                          leading: Image.network(
                              video['snippet']['thumbnails']['default']['url']),
                          title: Text(video['snippet']['title']),
                          subtitle: Text(video['snippet']['description']),
                          onTap: () {
                            String videoId = video['id']['videoId'];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    YouTubePlayerScreen(videoId: videoId),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: lilacColor,
        unselectedItemColor: lilacColor.withOpacity(0.6),
        backgroundColor: whiteColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Video Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class YouTubePlayerScreen extends StatelessWidget {
  final String videoId;

  const YouTubePlayerScreen({Key? key, required this.videoId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
    );
  }
}

class YouTubeService {
  final String apiKey = 'YOUR_API_KEY';
  final String channelId = 'YOUR_CHANNEL_ID';

  Future<List<dynamic>> fetchVideos() async {
    final String apiUrl =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&maxResults=10&order=date&type=video&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to fetch videos');
    }
  }
}
