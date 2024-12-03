import 'package:fund2me1/app/modules/home/controllers/home_controller.dart';
import 'package:fund2me1/app/modules/modul4/controllers/modul4_controller.dart';
import 'package:get/get.dart';

import '../controllers/kamera_controller.dart';

class KameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KameraController>(
      () => KameraController(),
    );
      Get.lazyPut<Modul4Controller>(
      () => Modul4Controller(),
    );
  }
}
