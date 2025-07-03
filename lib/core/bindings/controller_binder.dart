import 'package:get/get.dart';
import 'package:shuroo/features/company_user%20_profile/controller/other_user_profile_screen_controller.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/features/jobs/controller/favorite_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/make_post_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/my_all_post_screen_controller.dart';
import 'package:shuroo/features/profile/controller/change_password_controller.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import '../../features/jobs/controller/applied_controller.dart';
import '../../features/jobs/controller/interview_controller.dart';
import '../../features/jobs/controller/job_details_controller.dart';
import '../../features/jobs/controller/profile_view_controller.dart';
import '../../features/jobs/controller/short_listed_controller.dart';
import '../../features/profile/controller/profile_information_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
      fenix: true,
    );

    Get.lazyPut<ProfileInformationController>(
          () => ProfileInformationController(),
      fenix: true,
    );
    Get.lazyPut<ChangePasswordController>(
          () => ChangePasswordController(),
      fenix: true,
    );
    Get.lazyPut<PersonalCreationController>(
          () => PersonalCreationController(),
      fenix: true,
    );

    Get.lazyPut<MakePostController>(
          () => MakePostController(),
      fenix: true,
    );
    Get.lazyPut<MyAllPostScreenController>(() => MyAllPostScreenController(), fenix: true,);
    Get.lazyPut<ShortListedController>(() => ShortListedController(), fenix: true,);
    Get.lazyPut<ProfileViewController>(() => ProfileViewController(), fenix: true,);
    Get.lazyPut<InterviewController>(() => InterviewController(), fenix: true,);
    Get.lazyPut<AppliedController>(() => AppliedController(), fenix: true,);
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true,);
    Get.lazyPut<JobDetailsController>(() => JobDetailsController(), fenix: true,);
    Get.lazyPut<OtherUserProfileScreenControllar>(() => OtherUserProfileScreenControllar(), fenix: true,);



    // Get.lazyPut<JobController>(
    //       () => JobController(),
    //   fenix: true,
    // );
  }
}