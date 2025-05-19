import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';

import '../../../core/utils/constants/will_be_deleted.dart';
import '../data/model/job_Model.dart';

class JobController extends GetxController{

  final isFavorite = false.obs;
  final search = TextEditingController();

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

}