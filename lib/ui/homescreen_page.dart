import 'package:first_try/ui/chatscreen_page.dart';
import 'package:first_try/ui/profilepage.dart';
import 'package:first_try/ui/videoscreen_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http; // Corrected import statement

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color lilacColor = const Color(0xFFC8A2C8);
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;

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
      // ignore: avoid_print
      print('Error fetching videos: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate based on the selected index
    switch (index) {
      case 0:
        // Navigate to Home (Already here)
        break;
      case 1:
        // Handle Video Call navigation
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const VideoScreen(
                    videoId: '',
                  )),
        );
        break;
      case 2:
        // Handle Chat navigation
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 3:
        // Handle Profile navigation
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
                Text(
                  'All shows',
                  style: TextStyle(color: lilacColor),
                ),
                const SizedBox(width: 10),
                Text(
                  'YouTube',
                  style: TextStyle(color: lilacColor),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text(
                      'Live Stream',
                      style: TextStyle(color: lilacColor),
                    ),
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
                          onTap: () {},
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

class YouTubeService {
  final String apiKey = 'AIzaSyA26dmfwUUEqI1tT1ahpuogDk5eFWSLCRw';
  final String channelId = 'gXSXj0W_8j8';

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
