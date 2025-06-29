import 'dart:math' hide log;
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/features/jobs/data/model/get_all_jobs_model.dart';
import 'package:shuroo/features/jobs/presentation/screen/profile_view_screen.dart';
import 'package:shuroo/features/jobs/presentation/screen/short_listed_screen.dart';

import '../../../core/utils/constants/will_be_deleted.dart';
import '../data/model/job_Model.dart';
import '../presentation/screen/applied_job_screen.dart';
import '../presentation/screen/interview_screen.dart';

class JobController extends GetxController{

  final isFavorite = false.obs;
  final search = TextEditingController();

  final isLoading = false.obs;
  final getAllJobsModel = GetAllJobsModel().obs;

  final List<Widget> jobScreens = [
    AppliedJobScreen(),
    ProfileViewScreen(),
    ShortListedScreen(),
    InterviewScreen()

  ];

  final List<Jobs> jobs = [
    Jobs(
      id: 1,
      title: "Applied",
      icon: IconPath.applyImage,
    ),
    Jobs(
      id: 2,
      title: "Viewed",
      icon: IconPath.viewImage,
    ),
    Jobs(
      id: 3,
      title: "Shortlisted",
      icon: IconPath.shortListImage,
    ),
    Jobs(
      id: 4,
      title: "Interviews",
      icon: IconPath.interViewImage,
    ),
  ];

  final List<JobModel> jobModelList = [
    JobModel(
      id: 1,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      fullTimeText: "Fulltime",
      remoteText: "Remote",
      outreachText: "Outreach",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    JobModel(
      id: 2,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      fullTimeText: "Fulltime",
      remoteText: "Remote",
      outreachText: "Outreach",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.ecoLogo,
    ),
    JobModel(
      id: 3,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      fullTimeText: "Fulltime",
      remoteText: "Remote",
      outreachText: "Outreach",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    JobModel(
      id: 4,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      fullTimeText: "Fulltime",
      remoteText: "Remote",
      outreachText: "Outreach",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    JobModel(
      id: 5,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      fullTimeText: "Fulltime",
      remoteText: "Remote",
      outreachText: "Outreach",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.ecoLogo,
    ),
    JobModel(
      id: 6,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      fullTimeText: "Fulltime",
      remoteText: "Remote",
      outreachText: "Outreach",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
  ];

  void toggleFavorite(int index) {
    jobModelList[index].isFavorite.toggle();
  }

  @override
  void onInit() async {
    await fetchAllJobs();
    super.onInit();
  }


  Future<void> fetchAllJobs() async{
    isLoading.value = true;
    try{
      log('Hello jobs ..............................');
      final response = await NetworkCaller().getRequest(
        AppUrls.getAllJobs,
        token: "Bearer ${AuthService.token}"
      );
      if(response.isSuccess){
        print(response.responseData);
        final data = response.responseData;
        getAllJobsModel.value = GetAllJobsModel.fromJson(data);
      }
      else{
        AppSnackBar.showError('Something went wrong to fetch all jobs!');
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }
}