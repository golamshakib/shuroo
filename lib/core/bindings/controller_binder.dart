

import 'package:get/get.dart';
import 'package:shuroo/features/home/controller/home_controller.dart';

import 'package:shuroo/features/post_creation_repost_delete/controller/make_post_controller.dart';

import 'package:shuroo/features/jobs/controller/job_controller.dart';
import 'package:shuroo/features/jobs/controller/job_details_controller.dart';

import 'package:shuroo/features/profile/controller/change_password_controller.dart';
import 'package:shuroo/features/profile/controller/personal_creation_controller.dart';

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
    

    Get.lazyPut<JobController>(
          () => JobController(),
      fenix: true,
    );


  }
}