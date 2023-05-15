import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  static ImagePickerController get instance => Get.find();
  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: source);

    if (pickedFile != null) {
      // Save the image to a local file
      final File imageFile = File(pickedFile.path);
      return imageFile;
    }

    return null;
  }
}
