import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shuroo/core/utils/constants/icon_path.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';
import 'package:shuroo/core/utils/constants/will_be_deleted.dart';
import 'package:shuroo/features/search_notification_chat/data/model/top_jobs_model.dart';

import '../data/model/top_companies_model.dart';

class SearchingController  extends GetxController {

  final isFavorite = false.obs;
  final TextEditingController search = TextEditingController();

  final List<TopCompaniesModel> topCompaniesList = [
    TopCompaniesModel(
      id: 1,
      title: "WWC",
      buttonText: "View Jobs",
      icon: WillBeDeleted.ecoLogo,
    ),
    TopCompaniesModel(
      id: 2,
      title: "Nature First",
      buttonText: "View Jobs",
      icon: WillBeDeleted.uiLogo,
    ),
    TopCompaniesModel(
      id: 3,
      title: "ECO Solution",
      buttonText: "View Jobs",
      icon: WillBeDeleted.ecoLogo,
    ),
    TopCompaniesModel(
      id: 3,
      title: "Green Earth",
      buttonText: "View Jobs",
      icon: WillBeDeleted.uiLogo,
    ),
  ];

  final List<TopJobsModel> topJobsModelList = [
    TopJobsModel(
      id: 1,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      partTimeText: "Part-time",
      educationText: "Education",
      fieldWorkText: "Fieldwork",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    TopJobsModel(
      id: 2,
      title: "Environmental Research Assistant",
      subTitle: "Wild World Conservation",
      partTimeText: "Part-time",
      educationText: "Education",
      fieldWorkText: "Fieldwork",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    TopJobsModel(
      id: 3,
      title: "UI/UX Designer",
      subTitle: "Wild World Conservation",
      partTimeText: "Part-time",
      educationText: "Education",
      fieldWorkText: "Fieldwork",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),
    TopJobsModel(
      id: 4,
      title: "Environmental Research Assistant",
      subTitle: "Wild World Conservation",
      partTimeText: "Part-time",
      educationText: "Education",
      fieldWorkText: "Fieldwork",
      orText: "Portland, OR",
      applyText: "Apply Now",
      uiImagePath: WillBeDeleted.uiLogo,
    ),

  ];

  void toggleFavorite(int index) {
    topJobsModelList[index].isFavorite.toggle();
  }

}
