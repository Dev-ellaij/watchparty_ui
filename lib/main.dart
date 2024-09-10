import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JustUsGirlsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: use_key_in_widget_constructors
class JustUsGirlsScreen extends StatelessWidget {
  final Color lilacColor = const Color(0xFFC8A2C8);
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;

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
                const SizedBox(width: 10),
                Text(
                  'Web Series',
                  style: TextStyle(color: lilacColor),
                ),
                const SizedBox(width: 10),
                Text(
                  'Streams',
                  style: TextStyle(color: lilacColor),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ignore: sized_box_for_whitespace
            Container(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 180,
                      decoration: BoxDecoration(
                        color: lilacColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: blackColor,
                        child: Icon(Icons.favorite, color: redColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 10,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      3,
                      (index) => Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: lilacColor,
                              shape: BoxShape.circle,
                            ),
                          )),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'WORSHIP',
                  style: TextStyle(color: lilacColor),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: lilacColor),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ignore: sized_box_for_whitespace
            Container(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                    color: lilacColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: lilacColor,
        unselectedItemColor: lilacColor.withOpacity(0.6),
        backgroundColor: whiteColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
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
