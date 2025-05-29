import 'package:flutter/material.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/image_path.dart';

class JobTabBarCard extends StatelessWidget {
  final String title;
  final String company;
  final List<String> tags;
  final String location;

  const JobTabBarCard({
    super.key,
    required this.title,
    required this.company,
    required this.tags,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.only(left: 20,top: 20,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFDCF1E8),
                  child: Image.asset(ImagePath.image_c,height: 34.h,width: 34.w,),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(company,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(Icons.favorite_border,color: AppColors.secondaryTextColor,)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CustomText(text: tags[0],fontSize: 11,color: AppColors.secondaryTextColor,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CustomText(text: tags[1],fontSize: 11,color: AppColors.secondaryTextColor,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CustomText(text: tags[2],fontSize: 11,color: AppColors.secondaryTextColor,),
                ),
              ],
            ),


            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(location,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [

                      CustomText(text: "Apply Now",fontSize: 14,color: AppColors.custom_blue,),
                      Text("",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w500)),
                      Icon(Icons.arrow_forward, size: 16, color: Colors.blue),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
