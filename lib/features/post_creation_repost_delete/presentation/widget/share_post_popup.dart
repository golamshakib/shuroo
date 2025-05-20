import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

import '../../controller/my_all_post_screen_controller.dart';

void showPeopleBottomSheet(BuildContext context) {

  MyAllPostScreenController _controller = Get.put(MyAllPostScreenController());
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.only(top: 15, left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Person',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _controller.people_name.length,
                separatorBuilder: (_, __) => SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(_controller.people_icons[index], height: 32,width: 32,),
                        SizedBox(height: 6),
                        Container(
                          alignment: Alignment.center,
                             child: CustomText(text: _controller.people_name[index])),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
