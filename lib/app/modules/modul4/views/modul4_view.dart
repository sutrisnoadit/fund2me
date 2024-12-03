import 'package:flutter/material.dart';
import 'package:fund2me1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/modul4_controller.dart';

class Modul4View extends GetView<Modul4Controller> {
  const Modul4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul4View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               Get.toNamed(Routes.KAMERA);
              },
              child: const Text("Kamera"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.MICROPHONE);
                print("Speaker button pressed");
              },
              child: const Text("Microphone"),
            ),
          ],
        ),
      ),
    );
  }
}
