import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fund2me1/app/modules/kamera/controllers/kamera_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class KameraView extends GetView<KameraController> {
  const KameraView({Key? key}) : super(key: key);
  

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'), elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
 
              SizedBox(
                height: Get.height / 2.32,
                width: Get.width * 0.7,
                child: Obx(() {
                  return controller.isImageLoading.value
                      ? const CircularProgressIndicator()
                      : controller.selectedImagePath.value == ''
                          ? const Text('No image selected')
                          : ClipRRect(borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                  File(controller.selectedImagePath.value),fit:BoxFit.cover ),
                            );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.pickImage(ImageSource.gallery),
                child: const Text('Pick Image from Camera'),
              ),
               ElevatedButton(
                onPressed: () => controller.pickImage(ImageSource.camera),
                child: const Text('Pick Image from Camera'),
              ),
            
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
