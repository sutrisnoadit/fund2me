import 'package:fund2me1/app/modules/kamera/controllers/kamera_controller.dart';
import 'package:get/get.dart';

class Modul4Controller extends GetxController {


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Get.put(KameraController());
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
