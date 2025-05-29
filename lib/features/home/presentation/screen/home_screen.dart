import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_colors.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:get/get.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/features/home/presentation/widget/post_cards_widget.dart';
import 'package:shuroo/routes/app_routes.dart';
import '../widget/custom_drower.dart';
import '../widget/custom_home_post_card.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),

      drawer: CustomDrower(),

      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Image.asset(
                IconPath.icon_pro,
                height: 40,
                width: 40,
              ),
              SizedBox(width: 10),
              const Text(AppText.hi_rochelle),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.notificationScreen);
              },
              icon: Icon(Icons.notifications_none_outlined)),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PostCard(
            context: context,
            icon: IconPath.icon_1,
            organization: AppText.wildWorld,
            timeAgo: "1w ago",
            title: AppText.campus_Event,
            content: AppText.the_annualCareer,
            imageAsset: ImagePath.img_video,
            hashtags: AppText.careerFair,
          ),
          PostCardScrollhorizonta(
            icon: IconPath.icon_1,
            organization: AppText.brookfieldUniversity,
            timeAgo: "1w ago",
            title: "\uD83C\uDFC6 Alex Martin Wins Debate Tournament",
            content:
                "Congratulations to Alex Martin for taking home first place in the National Debate Championship! \uD83C\uDFC5",
            hashtags: "#StudentSpotlight #DebateChamps",
            imageAsset: ImagePath.img_video,
          ),
          PostCard(
            context: context,
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
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite_border), label: 'Favorites'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.add_circle_outline), label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.message_outlined), label: 'Messages'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.work_outline), label: 'Jobs'),
      //   ],
      // ),
    );
  }
}
