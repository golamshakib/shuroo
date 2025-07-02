import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/features/favorites/controller/favourite_controller.dart';
import 'package:shuroo/routes/app_routes.dart';

import '../../../../core/utils/constants/app_colors.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  final FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: CustomText(
            text: 'Favorites',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary),
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
                size: 50.h,
              ),
            )
          : SafeArea(
              child: Padding(
              padding: EdgeInsets.all(16),
              child: RefreshIndicator(
                onRefresh: controller.favoriteRefresh,
                displacement: 50,
                color: AppColors.white,
                backgroundColor: AppColors.customBlue,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                  itemCount: controller.favoriteInformation.data != null
                      ? controller.favoriteInformation.data!.length
                      : 0,
                  itemBuilder: (context, index) {
                    final favoritesList = controller.favoriteInformation.data![index];
                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color(0xffF5F5F5), width: 0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: ClipOval(
                                child: Image.asset(
                                  ImagePath.dummyProfilePicture,
                                  fit: BoxFit.fill,
                                  height: 34.h,
                                  width: 34.h,
                                ),
                              ),
                              title: CustomText(
                                text: favoritesList.job!.name.toString(),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                              subtitle: CustomText(
                                text: favoritesList.job?.company?.name ?? '',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGray,
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  controller.removeFavorite(
                                      favoritesList.id.toString());
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.custom_blue,
                                  size: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: CustomText(
                                      text:
                                          favoritesList.job!.employmentType.toString(),
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: CustomText(
                                      text:
                                          favoritesList.job!.employmentType.toString(),
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: CustomText(
                                      text:
                                          favoritesList.job!.employmentType.toString(),
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Divider(
                                color: Color(0xffF5F5F5),
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 16, left: 16, right: 16),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: favoritesList.job!.location
                                        .toString(),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoute.jobDetailsScreen);
                                    },
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: "Apply Now",
                                          decoration:
                                              TextDecoration.underline,
                                          decorationthickness: 2,
                                          decorationColor:
                                              AppColors.custom_blue,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.custom_blue,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.custom_blue,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ));
                  },
                ),
              ),
            ))),
    );
  }
}
