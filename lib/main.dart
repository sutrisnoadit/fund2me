//KELOMPOK 5
import 'package:flutter/material.dart';
import 'package:fund2me1/app/modules/kamera/controllers/kamera_controller.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'app/modules/provider/handlerPushNotification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  Get.put(KameraController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingHandler().initPushNotification();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
