import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ChatScreen extends StatelessWidget {
  final Color lilacColor = const Color(0xFFC8A2C8);
  final Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lilacColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          'Just US Girls Global',
          style: TextStyle(color: lilacColor),
        ),
        iconTheme: IconThemeData(color: lilacColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                bool isUserMessage = index % 2 == 0;
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: isUserMessage ? lilacColor : whiteColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: lilacColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      isUserMessage
                          ? 'Hello, how are you?'
                          : 'I’m good, thanks!',
                      style: TextStyle(
                        color: isUserMessage ? whiteColor : lilacColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: whiteColor,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: lilacColor),
                      filled: true,
                      fillColor: lilacColor.withOpacity(0.1),
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: lilacColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
