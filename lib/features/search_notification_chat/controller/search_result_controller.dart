import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuroo/features/search_notification_chat/data/model/search_result_model.dart';

import '../../../core/utils/constants/will_be_deleted.dart';

class SearchResultController extends GetxController{

  final isFavorite = false.obs;

  final search = TextEditingController();

  final List<Jobs> jobsSystemsModel = [
    Jobs(
      id: 1,
      title: "💼  All Jobs",
    ),
    Jobs(
      id: 2,
      title: "🛠️  Full-time",
    ),
    Jobs(
      id: 3,
      title: "🕐  Part-time",
    ),
    Jobs(
      id: 4,
      title: "🏠 Hybrid",
    ),
  ];

  final List<SearchResultModel> searchModelList = [
    SearchResultModel(
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
    SearchResultModel(
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
    SearchResultModel(
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
    SearchResultModel(
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
    SearchResultModel(
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
    SearchResultModel(
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
    searchModelList[index].isFavorite.toggle();
  }




  // New data...............................added




}





