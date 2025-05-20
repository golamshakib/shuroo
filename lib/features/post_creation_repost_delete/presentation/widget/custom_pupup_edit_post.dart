
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shuroo/app.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/features/post_creation_repost_delete/presentation/widget/share_post_popup.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../../../routes/app_routes.dart';

void showPostEditePopup(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _popupOption(
              icon: IconPath.share,
              title: AppText.sharevia,
              onTap: () {

                showPeopleBottomSheet(context);
// Add your logic here
                // Add your logic here
              },
            ),
            SizedBox(height: 20),

            _popupOption(
              icon: IconPath.edit,
              title: AppText.edtPost,
              onTap: () {
                _showCenteredCustomDialog(context);
// Add your logic here
              },
            ),
            SizedBox(height: 20),
            _popupOption(
              icon: IconPath.delete,
              title: AppText.deletePost,
              onTap: () {
                _showCenteredCustomDialog(context);

                // Add your logic here
              },
            ),
          ],
        ),
      );
    },
  );




}

void _showCenteredCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set color inside BoxDecoration
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(20),
          child: Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Makes the dialog wrap content

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomText(text: "Delete Post?",fontSize: 24,color: AppColors.textPrimary,)
                ),
                SizedBox(height: 8.h),
                Center(
                  child: CustomText(text: AppText.areYou,color: Color(0xFF555555),fontSize: 14,)
                ),
                Center(
                  child: CustomText(text: AppText.removedThis,color: Color(0xFF555555),fontSize: 14,)
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                      onTap: (){
                        Navigator.of(context).pop(); // Closes the dialog


                      }
                      ,
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFE6E6E7), // Light gray color
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CustomText(text: "Cancel",fontSize: 15,color: AppColors.grayText,),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pop(); // Closes the dialog


                        }
                        ,
                        child: Container(
                          alignment: Alignment.center,

                          height: 35,
                          decoration: BoxDecoration(
                            color: AppColors.custom_blue, // Light gray color
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child:CustomText(text: "Delete",color: AppColors.white,),
                        ),
                      ),
                    ),
                  ],
                )              ],
            ),
          ),
        ),
      );
    },
  );





}

Widget _popupOption({
  required String icon,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Image.asset(icon),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text:title ,fontSize: 14,color: AppColors.secondaryTextColor,),



              SizedBox(height: 4),

            ],
          ),
        ),
      ],
    ),
  );
}



