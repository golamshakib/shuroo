import 'package:get/get.dart';
import 'package:shuroo/features/authentication/controllers/social_login_controller.dart';
import 'package:shuroo/features/company_user%20_profile/controller/other_user_profile_screen_controller.dart';
import 'package:shuroo/features/dummy/controller/dummy2_controller.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';
import 'package:shuroo/features/jobs/controller/favorite_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/edit_post_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/make_post_controller.dart';
import 'package:shuroo/features/post_creation_repost_delete/controller/my_all_post_screen_controller.dart';
import 'package:shuroo/features/profile/controller/change_password_controller.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';
import '../../features/favorites/controller/favourite_controller.dart';
import '../../features/jobs/controller/applied_controller.dart';
import '../../features/jobs/controller/interview_controller.dart';
import '../../features/jobs/controller/job_details_controller.dart';
import '../../features/jobs/controller/profile_view_controller.dart';
import '../../features/jobs/controller/short_listed_controller.dart';
import '../../features/post_creation_repost_delete/controller/repost_with_throught_screen_controller.dart';
import '../../features/profile/controller/profile_information_controller.dart';
import '../../features/search_notification_chat/controller/notification_controller.dart';

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
    Get.lazyPut<MakePostController>(() => MakePostController(), fenix: true);
    Get.lazyPut<MyAllPostScreenController>(
          () => MyAllPostScreenController(),
      fenix: true,
    );
    Get.lazyPut<ShortListedController>(
          () => ShortListedController(),
      fenix: true,
    );
    Get.lazyPut<ProfileViewController>(
          () => ProfileViewController(),
      fenix: true,
    );
    Get.lazyPut<InterviewController>(
          () => InterviewController(),
      fenix: true,
    );
    Get.lazyPut<AppliedController>(
          () => AppliedController(),
      fenix: true,
    );
    Get.lazyPut<FavoriteController>(
          () => FavoriteController(),
      fenix: true,
    );
    Get.lazyPut<JobDetailsController>(
          () => JobDetailsController(),
      fenix: true,
    );
    Get.lazyPut<OtherUserProfileScreenControllar>(
          () => OtherUserProfileScreenControllar(),
      fenix: true,
    );
    Get.lazyPut<FavouriteController>(
          () => FavouriteController(),
      fenix: true,
    );
    Get.lazyPut<NotificationController>(
          () => NotificationController(),
      fenix: true,
    );
    Get.lazyPut<Dummy2Controller>(
          () => Dummy2Controller(),
      fenix: true,
    );


    Get.lazyPut<MakePostController>(() => MakePostController(),fenix: true);
    Get.lazyPut<PersonalCreationController>(() => PersonalCreationController(),fenix: true);
    Get.lazyPut<MyAllPostScreenController>(() => MyAllPostScreenController(), fenix: true,);
    Get.lazyPut<ShortListedController>(() => ShortListedController(), fenix: true,);
    Get.lazyPut<ProfileViewController>(() => ProfileViewController(), fenix: true,);
    Get.lazyPut<InterviewController>(() => InterviewController(), fenix: true,);
    Get.lazyPut<AppliedController>(() => AppliedController(), fenix: true,);
    Get.lazyPut<FavoriteController>(() => FavoriteController(), fenix: true,);
    Get.lazyPut<JobDetailsController>(() => JobDetailsController(), fenix: true,);
    Get.lazyPut<OtherUserProfileScreenControllar>(() => OtherUserProfileScreenControllar(), fenix: true,);
    Get.lazyPut<FavouriteController>(() => FavouriteController(), fenix: true,);
    Get.lazyPut<NotificationController>(() => NotificationController(), fenix: true,);
    Get.lazyPut<Dummy2Controller>(() => Dummy2Controller(), fenix: true,);
    Get.lazyPut<RepostWithThroughtScreenController>(() => RepostWithThroughtScreenController(), fenix: true,);
    Get.lazyPut<SocialLoginController>(()=>SocialLoginController(), fenix: true);
    Get.lazyPut<EditPostController>(()=>EditPostController(), fenix: true);

    // Get.lazyPut<JobController>(
    //       () => JobController(),
    //   fenix: true,
    // );

  }
}
 