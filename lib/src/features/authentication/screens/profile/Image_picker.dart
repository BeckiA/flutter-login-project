import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_app/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../../constants/image_strings.dart';
import '../../controllers/image_picker_controller.dart';

class ImagePickerWidget extends GetxController {
  ProfileScreen profileScreen = ProfileScreen();
  static ImagePickerWidget get instance => Get.find();
  late Rx<File?> imageFile;
  final _imagePickerController = Get.put(ImagePickerController());
  Future<void> getImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage == null) return;
    File tmpFile = File(pickedImage.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = p.basename(pickedImage.path);
    tmpFile = await tmpFile.copy('${appDir.path}/$fileName');

    _imagePickerController.setImageFile(tmpFile.path);
  }

  Widget displayPickedImage() {
    return Obx(() {
      final imagePath = _imagePickerController.imageFile.value;
      if (imagePath.isNotEmpty) {
        return Image.file(File(imagePath));
      } else {
        return Image.asset(
          VAProfileImage,
          fit: BoxFit.cover,
        );
      }
    });
  }
}
