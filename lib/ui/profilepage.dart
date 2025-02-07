import 'dart:io';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _avatarImage;
  final lilac = const Color(0xFFC8A2C8);
  final avatarPlaceholderUrl = 'https://via.placeholder.com/150';

  void _pickAvatarImage() {
    // TODO: Implement avatar image picker
  }

  void _pickBackgroundImage() {
    // TODO: Implement background image picker
  }

  Widget _buildListTile({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: lilac)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: _pickBackgroundImage,
          child: const Icon(Icons.image, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: lilac,
              ),
              Positioned(
                top: 120,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: GestureDetector(
                  onTap: _pickAvatarImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: _avatarImage != null
                        ? FileImage(_avatarImage!)
                        : NetworkImage(avatarPlaceholderUrl),
                    child: _avatarImage == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Center(
            child: Column(
              children: [
                Text(
                  "Ella Ogbonna",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "ella ogb__",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  "Mobile Dev | PR | PR",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildListTile(
            icon: Icons.edit,
            text: "Edit Profile",
            color: lilac,
            onTap: () {
              // Navigate to Edit Profile page
            },
          ),
          _buildListTile(
            icon: Icons.people,
            text: "Friends",
            color: lilac,
            onTap: () {
              // Navigate to Friends page
            },
          ),
          _buildListTile(
            icon: Icons.lock,
            text: "Change Password",
            color: lilac,
            onTap: () {
              // Navigate to Change Password page
            },
          ),
          _buildListTile(
            icon: Icons.settings,
            text: "Settings",
            color: lilac,
            onTap: () {
              // Navigate to Settings page
            },
          ),
          _buildListTile(
            icon: Icons.info,
            text: "About",
            color: lilac,
            onTap: () {
              // Navigate to About page
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/play');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/notifications');
              break;
            case 3:
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: lilac,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Play'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
