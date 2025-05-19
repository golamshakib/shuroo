import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

import '../widget/custom_drower.dart';
import '../widget/custom_home_post_card.dart';
import '../widget/custom_home_post_card_Scroll horizontal.dart';

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
            const Text(AppText.hi_rochelle),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none_outlined),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const PostCard(
            icon: IconPath.icon_1,
            organization: "Wild World Conservation ",
            timeAgo: "1w ago",
            title: "\uD83D\uDCC5 Campus Event: Career Fair 2024",
            content:
                "The annual Career Fair is next Wednesday at 10 AM in the student center. Meet recruiters from top companies and get ready to network! \uD83E\uDD1D",
            hashtags: "#CareerFair #Networking",
            imageAsset: ImagePath.img_video,

          ),



          PostCardScrollhorizonta(
            icon: IconPath.icon_1,

            organization: "Brookfield University",
            timeAgo: "1w ago",
            title: "\uD83C\uDFC6 Alex Martin Wins Debate Tournament",
            content:
            "Congratulations to Alex Martin for taking home first place in the National Debate Championship! \uD83C\uDFC5",
            hashtags: "#StudentSpotlight #DebateChamps",
            imageAsset: ImagePath.img_video,



          ),







          const PostCard(
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


//fgfffgit
