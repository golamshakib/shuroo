import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/search_notification_chat/data/model/get_searched_jobs_model.dart' hide Datum;
import '../../../core/utils/constants/will_be_deleted.dart';
import '../../jobs/data/model/get_all_jobs_model.dart';
import '../data/model/search_result_model.dart';

class SearchResultController extends GetxController {

  // variable
  final isLoading = false.obs;
  var selectedFilter = ''.obs;

  final search = TextEditingController();

  // Model class
  final getAllJob = GetAllJobsModel().obs;
  final getSearchJobModel = GetSearchedJobsModel().obs;


  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  @override
  void onInit() {
    super.onInit();
    searchJobs('');
    fetchAllJobs();
  }

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


  // Added by Shahriar
  Future<void> fetchAllJobs() async{
    isLoading.value = true;
    try{
      final response = await NetworkCaller().getRequest(
        AppUrls.getAllJobs,
        token: "Bearer ${AuthService.token}"
      );
      if(response.isSuccess){
        final data = response.responseData;
        getAllJob.value = GetAllJobsModel.fromJson(data);
      }else{
        AppSnackBar.showError('Something Went Wrong!');
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  //Added by Shahriar type handel
  List<Datum> get filteredJobs {
    if (getAllJob.value.data == null) return [];

    if (selectedFilter.value == 'ALL JOB') {
      return getAllJob.value.data!;
    }

    return getAllJob.value.data!
        .where((job) => job.employmentType?.toUpperCase() == selectedFilter.value)
        .toList();
  }

  // Added by Shahriar
  Future<void> searchJobs(String searchValue) async{
    isLoading.value = true;
    try{
      final response = await NetworkCaller().getRequest(
        AppUrls.getSearchJobs(searchValue),
        token: "Bearer ${AuthService.token}"
      );
      if(response.isSuccess){
        final data = response.responseData;
        print('Search data is:  $data');
        getSearchJobModel.value = GetSearchedJobsModel.fromJson(data);
      }else{
        AppSnackBar.showError('Something Went Wrong!');
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }finally{
      isLoading.value = false;
    }
  }

}
