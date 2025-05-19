import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FavouriteModel {
  final int? id;
  final String? title;
  final String? subTitle;
  final String? fullTimeText;
  final String? remoteText;
  final String? outreachText;
  final String? orText;
  final String? applyText;
  final String? uiImagePath;
  RxBool isFavorite;

  FavouriteModel({
    this.id,
    this.title,
    this.subTitle,
    this.fullTimeText,
    this.remoteText,
    this.outreachText,
    this.orText,
    this.applyText,
    this.uiImagePath,
    bool isFavorite = false,
  }) : isFavorite = isFavorite.obs;
}

