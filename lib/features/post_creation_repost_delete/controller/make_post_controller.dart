import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MakePostController extends GetxController {
  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  final textController = TextEditingController();


  var picUpload = "".obs;
  
  void pickProfile() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      picUpload.value = image.path;
    }
  }
}
