import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MakePostController extends GetxController {
  final textController = TextEditingController();
  var isNotEmpty = false.obs;

  var imagePath = ''.obs;

  void pickImage() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      imagePath.value = pickImage.path;
    }
  }
}
