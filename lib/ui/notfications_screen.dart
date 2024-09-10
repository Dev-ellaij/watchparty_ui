import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final int notificationCount;
  final int friendRequestCount;

  // ignore: use_super_parameters
  const NotificationsScreen({
    Key? key,
    required this.notificationCount,
    required this.friendRequestCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Notifications ($notificationCount)',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const NotificationCard(
            channelName: "Just Us Girls Global",
            nickname: "Girls",
            description: "A brief description about the video goes here.",
            time: "3hr 10min",
          ),
          const SizedBox(height: 20),
          Text(
            'Friend Requests ($friendRequestCount)',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const FriendRequestCard(
            avatarName: 'Emmanuella',
            displayName: 'Ella',
          ),
          const FriendRequestCard(
            avatarName: 'John Doe',
            displayName: 'John',
          ),
          const FriendRequestCard(
            avatarName: 'Jane Smith',
            displayName: 'Jane',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.purpleAccent),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow, color: Colors.purpleAccent),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.purpleAccent),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.purpleAccent),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String channelName;
  final String nickname;
  final String description;
  final String time;

  // ignore: use_super_parameters
  const NotificationCard({
    Key? key,
    required this.channelName,
    required this.nickname,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    channelName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    nickname,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 60,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    channelName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _buildActionButton('Join', Colors.purpleAccent),
              const SizedBox(width: 20),
              _buildActionButton('Reject', Colors.purpleAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FriendRequestCard extends StatelessWidget {
  final String avatarName;
  final String displayName;

  // ignore: use_super_parameters
  const FriendRequestCard({
    Key? key,
    required this.avatarName,
    required this.displayName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(avatarName[0], style: const TextStyle(color: Colors.white)),
      ),
      title:
          Text(avatarName, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(displayName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildActionButton('Confirm', Colors.purpleAccent),
          const SizedBox(width: 10),
          _buildActionButton('Reject', Colors.purpleAccent),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color) {
    return Container(
      height: 40,
      width: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
