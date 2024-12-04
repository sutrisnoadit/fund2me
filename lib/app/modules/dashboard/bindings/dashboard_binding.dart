import 'package:fund2me1/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

import 'package:fund2me1/app/modules/dashboard/controllers/dashboard_controller_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardControllerController>(
      () => DashboardControllerController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut(()=>SettingController());
  }
}
