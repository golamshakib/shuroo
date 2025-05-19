import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

import '../widget/custom_drower.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrower(),

      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(IconPath.icon_pro,height:40,width: 40,),
            SizedBox(width: 10),
            const Text("Hi, Rochelle"),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none_outlined),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PostCard(
            icon: IconPath.icon_1,
            organization: "Wild World Conservation ",
            timeAgo: "1w ago",
            title: "\uD83D\uDCC5 Campus Event: Career Fair 2024",
            content:
                "The annual Career Fair is next Wednesday at 10 AM in the student center. Meet recruiters from top companies and get ready to network! \uD83E\uDD1D",
            hashtags: "#CareerFair #Networking",
            imageAsset: ImagePath.img_video,

          ),
          PostCard(


            icon: IconPath.icon_1,

            organization: "Brookfield University",
            timeAgo: "1w ago",
            title: "\uD83C\uDFC6 Alex Martin Wins Debate Tournament",
            content:
                "Congratulations to Alex Martin for taking home first place in the National Debate Championship! \uD83C\uDFC5",
            hashtags: "#StudentSpotlight #DebateChamps",
            imageAsset: ImagePath.img_video,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline), label: 'Jobs'),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String organization;
  final String timeAgo;
  final String title;
  final String content;
  final String icon;
  final String hashtags;
  final String imageAsset;

  const PostCard({
    super.key,
    required this.organization,
    required this.timeAgo,
    required this.title,
    required this.content,
    required this.hashtags,
    required this.imageAsset,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Image.asset(icon),
                      Text(organization,
                          style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: "Cabinet Grotesk")),
                    ],
                  ),
                ),
                Expanded(flex: 1,child: Container(alignment:Alignment.topCenter,child: Text(timeAgo, style: const TextStyle(color: Colors.grey)))),
              ],
            ),
            const SizedBox(height: 8),
            Text(title),
            const SizedBox(height: 4),
            Text(content),
            const SizedBox(height: 4),
            Text(hashtags, style: const TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imageAsset, fit: BoxFit.cover,height: 151,width: 341,),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("\u2764\uFE0F 13 likes"),
                Text("\uD83D\uDCAC 6 comments"),
                Text("\u21BA Repost"),
                Text("\u27A1\uFE0F Send"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
