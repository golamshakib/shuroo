import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/company_user%20_profile/controller/other_user_profile_screen_controller.dart';

import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../home/presentation/widget/custom_home_post_card.dart';
import '../widget/job_tabbar_card.dart';
import '../widget/tabbar_about_item.dart';

class OtherUserProfileScreen extends StatelessWidget {
   OtherUserProfileScreen({super.key});

  final OtherUserProfileScreenControllar _controller =
  Get.put(OtherUserProfileScreenControllar());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // required if not already handled in controller
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Jams Walton",
            fontSize: 20,
            color: AppColors.primaryTextColor,
          ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 39, left: 16, right: 16),
              child: Column(
                children: [
                  Image.asset(ImagePath.image_u,height: 120.h,width: 120.w,),
                  const SizedBox(height: 16),
                  const CustomText(
                      text: "Jams Walton", fontSize: 20),
                  CustomText(
                    text: "UI/UX Designer",
                    fontSize: 16,
                    color: AppColors.secondaryTextColor,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child:
                        CustomSubmitButton(text: ' Message', onTap: () {}),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        flex: 1,
                        child:
                        Image.asset(IconPath.share1, height: 40, width: 40),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    child: TabBar(
                      controller: _controller.tabController,
                      indicatorColor: AppColors.custom_blue,
                      labelColor: AppColors.custom_blue,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(text: 'Post'),
                        Tab(text: 'About'),

                      ],
                    ),
                  )
                ],
              ),
            ),
            // This Expanded is valid now because it's inside Column outside ScrollView
            Expanded(
              child:TabBarView(
                controller: _controller.tabController,
                children: [
                  ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 16, left: 16),
                        child: PostCard(
                          context: context,
                          icon: IconPath.icon_1,
                          organization: AppText.wildWorld,
                          timeAgo: "1w ago",
                          title: AppText.campus_Event,
                          content: AppText.the_annualCareer,
                          imageAsset: ImagePath.img_video,
                          hashtags: AppText.careerFair,
                        ),
                      );
                    },
                  ),
                  ResumeScreen(), // ✅ now it works perfectly
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle("About"),
              const Text(
                "I'm a passionate UI/UX Designer focused on creating intuitive, beautiful, and user-centered digital experiences...",
                style: TextStyle(fontSize: 16),
              ),

              sectionTitle("Experience"),
              experienceCard(
                title: "Sustainability Intern",
                company: "Green Earth Foundation",
                date: "June 2023 - August 2023",
                details: [
                  "Conducted research on sustainable farming.",
                  "Assisted in community outreach programs.",
                ],
              ),
              experienceCard(
                title: "Research Assistant",
                company: "Brookfield University",
                date: "January 2023 - May 2023",
                details: [
                  "Helped organize and facilitate biodiversity workshops.",
                ],
              ),

              sectionTitle("Education"),
              educationCard(
                school: "Brookfield University",
                degree: "B.Sc. in Environmental Science",
                date: "2021 - Present",
              ),
              educationCard(
                school: "Green Valley High School",
                degree: "High School Diploma",
                date: "Graduated 2021",
              ),

              sectionTitle("Skills"),
              Wrap(
                children: [
                  pill("Interface Design"),
                  pill("UI Design"),
                  pill("UX Design"),
                  pill("Branding Design"),
                  pill("Graphic Design"),
                  pill("Motion Design"),
                ],
              ),

              sectionTitle("Interests"),
              Wrap(
                children: [
                  pill("Climate Change Advocacy"),
                  pill("Urban Gardening"),
                  pill("Hiking"),
                  pill("Sustainable Farming"),
                  pill("Eco-Friendly Architecture"),
                ],
              ),

              sectionTitle("Languages"),
              Wrap(
                children: [
                  pill("English"),
                  pill("Arabic"),
                  pill("Bangla"),
                  pill("French"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget experienceCard({
    required String title,
    required String company,
    required String date,
    required List<String> details,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(company, style: const TextStyle(color: Colors.grey)),
            Text(date, style: const TextStyle(fontSize: 12)),
            ...details.map((e) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text("• $e"),
            )),
          ],
        ),
      ),
    );
  }

  Widget educationCard({
    required String school,
    required String degree,
    required String date,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(school, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(degree),
            Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}








