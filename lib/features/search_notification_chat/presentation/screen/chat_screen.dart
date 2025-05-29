import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(IconPath.personIcon), // Replace with your asset
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Jhon Jons', style: TextStyle(color: Colors.black, fontSize: 16)),
                  Text('Active now', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildUserMessage("Hi! I’m looking for UI/UX design roles in London. Do you have anything available right now?"),
                  const SizedBox(height: 12),
                  _buildBotMessage("Hello! Yes, we have a few openings that match your profile. I’ll send over the details shortly."),
                ],
              ),
            ),
            const Divider(height: 1),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(left: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Text(text),
            ),
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage('assets/user.png'), // Replace with user image asset
          ),
        ],
      ),
    );
  }

  Widget _buildBotMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage('assets/bot.png'), // Replace with bot image asset
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(right: 40),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type here...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
