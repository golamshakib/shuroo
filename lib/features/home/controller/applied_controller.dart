import 'package:get/get.dart';
import 'package:shuroo/core/utils/constants/will_be_deleted.dart';
import 'package:shuroo/features/home/data/model/applied_model.dart';

class AppliedController extends GetxController{

  final List<AppliedModel> appliedList = [
    AppliedModel(
      id: 1,
      title: "UI/UX Designer",
      appliedButtonText: "Applied",
      name: "Wild World Conservation",
      salary: "Exp Salary: \$2500",
      date: 'Applied: 15 April 2025',
      sendButtonText: "Send Message",
      imagePath: WillBeDeleted.ecoLogo

    )  ,
    AppliedModel(
      id: 2,
      title: "Climate Policy Intern",
      appliedButtonText: "Applied",
      name: "Wild World Conservation",
      salary: "Exp Salary: \$2500",
      date: 'Applied: 15 April 2025',
      sendButtonText: "Send Message",
      imagePath: WillBeDeleted.uiLogo

    ),
    AppliedModel(
      id: 3,
      title: "UI/UX Designer",
      appliedButtonText: "Applied",
      name: "Wild World Conservation",
      salary: "Exp Salary: \$2500",
      date: 'Applied: 15 April 2025',
      sendButtonText: "Send Message",
      imagePath: WillBeDeleted.ecoLogo

    )

  ];
}