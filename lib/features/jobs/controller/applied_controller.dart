import 'package:get/get.dart';
import 'package:shuroo/core/common/widgets/app_snackbar.dart';
import 'package:shuroo/core/services/Auth_service.dart';
import 'package:shuroo/core/services/network_caller.dart';
import 'package:shuroo/core/utils/constants/app_urls.dart';
import 'package:shuroo/core/utils/constants/will_be_deleted.dart';
import 'package:shuroo/features/jobs/data/model/applied_model.dart';

class AppliedController extends GetxController {
  RxList<AppliedModel> appliedItem = <AppliedModel>[].obs;

  final List<AppliedModel> appliedList = [
    AppliedModel(
        id: 1,
        title: "UI/UX Designer",
        appliedButtonText: "Applied",
        name: "Wild World Conservation",
        salary: "Exp Salary: \$2500",
        date: 'Applied: 15 April 2025',
        sendButtonText: "Send Message",
        imagePath: WillBeDeleted.ecoLogo),
    AppliedModel(
        id: 2,
        title: "Climate Policy Intern",
        appliedButtonText: "Applied",
        name: "Wild World Conservation",
        salary: "Exp Salary: \$2500",
        date: 'Applied: 15 April 2025',
        sendButtonText: "Send Message",
        imagePath: WillBeDeleted.uiLogo),
    AppliedModel(
        id: 3,
        title: "UI/UX Designer",
        appliedButtonText: "Applied",
        name: "Wild World Conservation",
        salary: "Exp Salary: \$2500",
        date: 'Applied: 15 April 2025',
        sendButtonText: "Send Message",
        imagePath: WillBeDeleted.ecoLogo)
  ];

  Future<void> getAppliedItem() async {
    try {
      final response = await NetworkCaller()
          .getRequest(AppUrls.appliedItem, token: AuthService.token);

      if (response.isSuccess && response.statusCode == 200) ;
      AppSnackBar.showSuccess('');
    } catch (e) {
      print('');
    }
  }
}
