import 'package:fund2me1/app/modules/kamera/controllers/kamera_controller.dart';
import 'package:get/get.dart';

import '../controllers/modul4_controller.dart';

class Modul4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Modul4Controller>(
      () => Modul4Controller(),
    );
     Get.lazyPut<KameraController>(
      () => KameraController(),
    );
  }
}
