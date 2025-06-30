import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';

import '../../controller/my_all_post_screen_controller.dart';

void showPeopleBottomSheet(BuildContext context) {
  final controller = Get.find<MyAllPostScreenController>();
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
                itemCount: controller.peopleName.length,
                separatorBuilder: (_, __) => SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          controller.peopleIcons[index],
                          height: 32,
                          width: 32,
                        ),
                        SizedBox(height: 6),
                        Container(
                            alignment: Alignment.center,
                            child: CustomText(
                                text: controller.peopleName[index])),
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
