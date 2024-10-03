import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DashboardController extends GetxController {
    var selectedIndex = 0.obs;
    var selectedImagePath = ''.obs;

  void onTabTapped(int index){
      selectedIndex.value = index;
     
    }
    
    // void pickImage() async {
    //   final ImagePicker picker = ImagePicker();
    //   final XFile? image = await picker.pickImage(source: ImageSource.camera);

    //   if (image != null) {
    //     selectedImagePath.value = image.path;
    //   } else {
    //     Get.snackbar("Error", "No image selected");
    //   }
    // }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
