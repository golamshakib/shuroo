import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TopJobsModel {
  final int? id;
  final String? title;
  final String? subTitle;
  final String? partTimeText;
  final String? educationText;
  final String? fieldWorkText;
  final String? orText;
  final String? applyText;
  final String? uiImagePath;
  RxBool isFavorite;

  TopJobsModel({
    this.id,
    this.title,
    this.subTitle,
    this.partTimeText,
    this.educationText,
    this.fieldWorkText,
    this.orText,
    this.applyText,
    this.uiImagePath,
    bool isFavorite = false,
  }) : isFavorite = isFavorite.obs;
}

