import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/common/widgets/custom_appbar.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_texts.dart';
import '../../../home/presentation/widget/custom_home_post_card.dart';
import '../../controller/company_profile_screen_controller.dart';

class CompanyProfileScreen extends StatelessWidget  {
   CompanyProfileScreen({super.key});

   CompanyProfileScreenController _controller = Get.put(CompanyProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Wild World Conservation",
          fontSize: 20,
          color: AppColors.primaryTextColor,
        ),
      ),
      
      
      body: SafeArea(child: SingleChildScrollView(

        child:Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 39,left: 16,right: 16),
              child: Column(
                children: [
                  Image.asset(ImagePath.image_c),
                  SizedBox(
                    height: 16,
                  ),
                  CustomText(text: "Wild World Conservation",fontSize: 20,),
                  CustomText(text: "www.wildworldconservation.com",fontSize: 16,color:
                  AppColors.secondaryTextColor,),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: CustomSubmitButton(text: ' Message', onTap: () {  },)),
                     SizedBox(width:18 ,),

                      Expanded(
                          flex: 1, child:
                      Image.asset(IconPath.share,height: 24,width: 24,))
                    ],

                    
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 46),
                    child: TabBar(
                      controller: _controller.tabController,
                      indicatorColor: AppColors.custom_blue,
                      labelColor: AppColors.custom_blue,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.tab,

                      tabs: [
                        Tab(text: 'Post'),
                        Tab(text: 'About'),
                        Tab(text: 'Jobs'),
                      ],

                    ),
                  )

                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller.tabController,
                children: <Widget>[
                  Text('hdhdjjd'),
                  Text('hdhdjjd'),
                  Text('hdhdjjd'),

              ],),
            )

            
            
          ],
          
        ),
        
        
      )),
    );
  }
}
