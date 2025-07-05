import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/features/search_notification_chat/data/model/get_all_notification_model.dart';
import 'package:shuroo/features/search_notification_chat/data/model/notification_model.dart';

class NotificationController extends GetxController{

  //final TextEditingController search = TextEditingController();

  final List<NotificationModel> notificationList = [
    NotificationModel(
      id: 1,
      title: "You're shortlisted!",
      time: "3h ago",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
    ),
    NotificationModel(
      id: 2,
      title: "You're shortlisted!",
      time: "3h ago",
      subTitle: "Hi there! I came across your recruitment services and I’m currently exploring new...",
    ),
  ];

  final isLoading = false.obs;
  final getAllNotification = GetAllNotificationModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotification();
  }


  Future<void> fetchNotification() async{
    isLoading.value = true;
    try{
      final response = await NetworkCaller().getRequest(
        AppUrls.getAllNotification,
        token: "Bearer ${AuthService.token}"
      );
      if(response.isSuccess){
        final data = response.responseData;
        getAllNotification.value = GetAllNotificationModel.fromJson(data);
      }else{
        AppSnackBar.showError("Something Went Wrong!");
      }
    }catch(e){
      AppSnackBar.showError(e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}