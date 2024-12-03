import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maps',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF692729),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.position.value == null) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        }

        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              controller.position.value!.latitude,
              controller.position.value!.longitude,
            ),
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('user_location'),
              position: LatLng(
                controller.position.value!.latitude,
                controller.position.value!.longitude,
              ),
              infoWindow: const InfoWindow(title: 'You are here'),
            ),
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.updateLocation(),
        backgroundColor: const Color(0xFF692729),
        icon: const Icon(Icons.my_location),
        label: const Text('Refresh Location'),
      ),
    );
  }
}
