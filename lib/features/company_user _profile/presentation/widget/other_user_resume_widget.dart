import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/icon_path.dart';

class ResumeScreen extends StatelessWidget {
  ResumeScreen({super.key});

  final controllerOne = Get.find<PersonalCreationController>();

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = controllerOne.userProfile.value.data;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "About",
                  color: AppColors.secondaryTextColor,
                  fontSize: 16,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          offset: const Offset(4, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: CustomText(
                      text: user?.about ?? "No bio provided",
                      fontSize: 16,
                      color: AppColors.secondaryTextColor,
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Experience",
                  color: AppColors.secondaryTextColor,
                  fontSize: 16,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // <-- Key to align items at the top
                        children: [
                          // Icon aligned to top left
                          Image.asset(
                            IconPath.user_t,
                            height: 34.h,
                            width: 34.w,
                          ),
                          SizedBox(width: 10),
                          // Optional spacing between icon and text

                          // Content to the right of the icon
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: user?.experience?.first.company ??
                                      "Position not available",
                                  fontSize: 15,
                                  color: AppColors.textPrimary,
                                ),
                                CustomText(
                                  text: user?.experience?.first.title ??
                                      "Company not available",
                                  fontSize: 12,
                                  color: AppColors.textPrimary,
                                ),
                                CustomText(
                                  text:
                                      "${user?.experience?.first.startDate} - ${user?.experience?.first.endDate} ",
                                  fontSize: 12,
                                  color: AppColors.grayText,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text:
                                      "• ${user?.experience?.first.description}.",
                                  fontSize: 12,
                                  color: AppColors.textPrimary,
                                ),
                                // CustomText(
                                //   text:
                                //       "  Assisted in community outreach programs..",
                                //   fontSize: 12,
                                //   color: AppColors.textPrimary,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // <-- Key to align items at the top
                        children: [
                          // Icon aligned to top left
                          Image.asset(
                            IconPath.user_e,
                            height: 34.h,
                            width: 34.w,
                          ),
                          SizedBox(width: 10),
                          // Optional spacing between icon and text

                          // Content to the right of the icon
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Sustainability Intern",
                                  fontSize: 15,
                                  color: AppColors.textPrimary,
                                ),
                                CustomText(
                                  text: "Green Earth Foundation",
                                  fontSize: 12,
                                  color: AppColors.textPrimary,
                                ),
                                CustomText(
                                  text: "June 2023 - August 2023",
                                  fontSize: 12,
                                  color: AppColors.grayText,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "•  ",
                                      fontSize: 12,
                                      color: AppColors.textPrimary,
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text:
                                            "Helped organize and facilitate educational workshops on biodiversity conservation.",
                                        fontSize: 12,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Education",
                  color: AppColors.secondaryTextColor,
                  fontSize: 16,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // <-- Key to align items at the top
                        children: [
                          // Icon aligned to top left
                          Image.asset(
                            IconPath.user_e,
                            height: 34.h,
                            width: 34.w,
                          ),
                          SizedBox(width: 10),
                          // Optional spacing between icon and text

                          // Content to the right of the icon
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Brookfield University",
                                  fontSize: 15,
                                  color: AppColors.textPrimary,
                                ),
                                CustomText(
                                  text:
                                      "Bachelor of Science in Environmental Science",
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                                CustomText(
                                  text: "June 2023 - August 2023",
                                  fontSize: 12,
                                  color: AppColors.grayText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // <-- Key to align items at the top
                        children: [
                          // Icon aligned to top left
                          Image.asset(
                            IconPath.user_t,
                            height: 34.h,
                            width: 34.w,
                          ),
                          SizedBox(width: 10),
                          // Optional spacing between icon and text

                          // Content to the right of the icon
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Green Valley High School ",
                                    fontSize: 15,
                                    color: AppColors.textPrimary,
                                  ),
                                  CustomText(
                                    text: "High School Diploma",
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                  CustomText(
                                    text: "Graduated 2021",
                                    fontSize: 12,
                                    color: AppColors.grayText,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Skills",
                  color: AppColors.secondaryTextColor,
                  fontSize: 16,
                ),
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
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Interests",
                  color: AppColors.secondaryTextColor,
                  fontSize: 16,
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    pill("Climate Change Advocacy"),
                    pill("Urban Gardening"),
                    pill("Hiking"),
                    pill("Sustainable Farming"),
                    pill("Eco-Friendly Architecture"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Languages",
                  color: AppColors.secondaryTextColor,
                  fontSize: 16,
                ),
                SizedBox(
                  height: 10,
                ),
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
        title:
            Text(school, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(degree),
            Text(date,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
