import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'dart:io'; // To handle file operations

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            if (controller.selectedImagePath.value != '') {
              return Column(
                children: [
                  Text('Preview:'),
                   SizedBox(height: 10),
                    Image.file(
                    File(controller.selectedImagePath.value),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              );
            } else {
              return Text('No Image Selected');
            }
          }),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.pickImage(); 
            },
            child: Text('Upload Image'),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Container(
          color: Color(0xff692729),
          child: Obx(() {
            return BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onTabTapped,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Color(0xff692729),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: 'Location',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
