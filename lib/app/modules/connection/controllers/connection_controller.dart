import 'package:fund2me1/app/modules/home/views/home_view.dart';
import 'package:fund2me1/app/modules/signin/views/signin_view.dart';
import 'package:get/get.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../views/connection_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionController extends GetxController {
  //TODO: Implement ConnectionController
  final Connectivity _connectivity = Connectivity();
  final count = 0.obs;
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {

    if (connectivityResult == ConnectivityResult.none) {
      Get.offAll(() => const NoConnectionView());
    } else {
   
      if (Get.currentRoute == '/NoConnectionView') {
        Get.offAll(() => HomeView());
      }
    }
  }
  @override
  void onInit() {
    super.onInit();
     _connectivity.onConnectivityChanged.listen((connectivityResults) {
      _updateConnectionStatus(connectivityResults.first);
    });
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