// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/common/styles/get_text_style.dart';
// import '../../../../core/utils/constants/app_colors.dart';
// import '../../controllers/nav_bar_controller.dart';
//
// class CreatorNavBar extends StatelessWidget {
//   const CreatorNavBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetX<CreatorNavBarController>(
//         builder: (creatorNavController) =>
//         creatorNavController.screens[creatorNavController.currentIndex],
//       ),
//       bottomNavigationBar: GetX<CreatorNavBarController>(
//         builder: (navController) {
//           return BottomNavigationBar(
//             backgroundColor: AppColors.white,
//             currentIndex: navController.currentIndex,
//             selectedItemColor: AppColors.primary,
//             unselectedItemColor: const Color(0xff263238),
//             showUnselectedLabels: true,
//             onTap: navController.changeIndex,
//             items: List.generate(
//               navController.activeIcons.length,
//                   (index) {
//                 return BottomNavigationBarItem(
//                   backgroundColor: Colors.white,
//                   icon: navController.currentIndex == index
//                       ? navController.activeIcons[index]
//                       : navController.inActiveIcons[index],
//                   label: navController.labels[index],
//                   tooltip: navController.labels[index],
//                 );
//               },
//             ),
//             selectedLabelStyle: getTextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 11,
//               color: AppColors.primary,
//             ),
//             unselectedLabelStyle: getTextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 11,
//               color: AppColors.textPrimary,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../controllers/nav_bar_controller.dart';


class NavBar extends StatelessWidget {

  NavBar({super.key});

  final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: controller.screens[controller.currentIndex],
          bottomNavigationBar: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 90,sigmaY: 90),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.1),
                  //     blurRadius: 10,
                  //     offset: const Offset(0, -5),
                  //   ),
                  // ],
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(Icons.home_outlined, 'Home', 0, controller),
                    _buildNavItem(Icons.favorite_border_outlined, 'Favorites', 1, controller),
                    _buildAddButton(context,2),
                    _buildNavItem(Icons.email_outlined, 'Messages', 3, controller),
                    _buildNavItem(Icons.work_outline_outlined, 'Jobs', 4, controller),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, NavBarController controller) {
    final isSelected = controller.currentIndex == index;

    // // Adjust index for the actual screens array since we have the add button in the middle
    // final screenIndex = index > 2 ? index - 1 : index;

    return InkWell(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Color(0xff01A8F9) : Color(0xffB7B7B7),
            size: 30,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0xff01A8F9): Color(0xffB7B7B7),
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, int index) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: [
              Color(0xff0199E3),
              Color(0xff34B9FA),
              Color(0xff8AD7FC),
            ])
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
