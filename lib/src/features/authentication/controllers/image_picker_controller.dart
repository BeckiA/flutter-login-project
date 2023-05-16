import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePickerController extends GetxController {
  final imageFile = ''.obs;

  Future<void> setImageFile(String imagePath) async {
    imageFile.value = imagePath;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', imagePath);
  }

  @override
  void onInit() {
    super.onInit();
    loadImageFile();
  }

  Future<void> loadImageFile() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('imagePath') ?? '';
    imageFile.value = imagePath;
  }
}
