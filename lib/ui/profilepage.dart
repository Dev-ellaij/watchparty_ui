import 'dart:io'; // Import for handling File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import for image picker

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _backgroundImage; // XFile is now recognized
  XFile? _avatarImage;
  final ImagePicker _picker = ImagePicker(); // Image picker instance

  // Define the custom color
  final Color lilac = const Color(0xFFED7EFF); // Your specific lilac color

  // Placeholder network URLs
  final String backgroundPlaceholderUrl =
      'https://example.com/placeholder_background.jpg';
  final String avatarPlaceholderUrl =
      'https://example.com/placeholder_avatar.png';

  Future<void> _pickBackgroundImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _backgroundImage = image;
      });
    }
  }

  Future<void> _pickAvatarImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _avatarImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
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
              // Display the network URL background image or the user's selected image
              _backgroundImage != null
                  ? Image.file(
                      File(_backgroundImage!.path), // Use File from dart:io
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      backgroundPlaceholderUrl, // Network placeholder image
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
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
                        ? FileImage(
                            File(_avatarImage!.path)) // Use File from dart:io
                        : NetworkImage(
                            avatarPlaceholderUrl), // Network placeholder avatar image
                    child: _avatarImage == null
                        ? const Icon(Icons.person,
                            size: 50) // Fallback icon if no avatar is selected
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
            child: _buildListTile(
                icon: Icons.edit, text: "Edit Profile", color: lilac),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FriendsPage()),
              );
            },
            child: _buildListTile(
                icon: Icons.people, text: "Friends", color: lilac),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage()),
              );
            },
            child: _buildListTile(
                icon: Icons.lock, text: "Change Password", color: lilac),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            child: _buildListTile(
                icon: Icons.settings, text: "Settings", color: lilac),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
            child:
                _buildListTile(icon: Icons.info, text: "About", color: lilac),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage()),
              );
            },
            child: _buildListTile(
                icon: Icons.lock, text: "Change Password", color: Colors.red),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set the index for ProfileScreen
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
              // Stay on the Profile screen
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: lilac, // Use lilac for the bottom nav bar
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Play'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.white, // Color of the selected item
        unselectedItemColor: Colors.black, // Color of the unselected items
      ),
    );
  }

  ListTile _buildListTile(
      {required IconData icon, required String text, required Color color}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(text),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Icon(Icons.arrow_back, color: color),
        ],
      ),
    );
  }
}

// Example Pages
// ignore: use_key_in_widget_constructors
class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: const Center(child: Text('Edit Profile Page')),
    );
  }
}

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Friends')),
      body: const Center(child: Text('Friends Page')),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: const Center(child: Text('Change Password Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Page')),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Center(child: Text('About Page')),
    );
  }
}
