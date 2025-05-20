import 'package:get/get_rx/src/rx_types/rx_types.dart';

class JobModel {
  final int? id;
  final String? title;
  final String? subTitle;
  final String? fullTimeText;
  final String? remoteText;
  final String? outreachText;
  final String? orText;
  final String? applyText;
  final String? uiImagePath;
  final String? icon;
  RxBool isFavorite;

  JobModel({
    this.id,
    this.title,
    this.subTitle,
    this.fullTimeText,
    this.remoteText,
    this.outreachText,
    this.orText,
    this.applyText,
    this.uiImagePath,
    this.icon,
    bool isFavorite = false,
  }) : isFavorite = isFavorite.obs;
}

class Jobs {
  final int? id;
  final String? title;
  final String? icon;

  Jobs({
    this.id,
    this.title,
    this.icon,
  });
}
