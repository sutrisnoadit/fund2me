import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';
import 'package:fund2me1/app/modules/my_address/controllers/my_address_controller.dart'; // Import controller MyAddress
import 'package:fund2me1/app/modules/my_address/views/my_address_view.dart'; // Import halaman MyAddressView

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Profile',
        style: TextStyle(
          color: Colors.white, // Title text color
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF692729), // Deep brown color
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.wallet, color: Colors.white),
          onPressed: () {
            // Handle wallet button press
          },
        ),
      ],
    );
  }

  Widget buildBody() {
    return Container(
      color: const Color(0xfff2cebe), // Soft pink background color
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          buildProfileSection(),
          const SizedBox(height: 30),
          buildOptionsList(),
        ],
      ),
    );
  }

  Widget buildProfileSection() {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                    "assets/img/hilma.png"), // Replace with actual image URL
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color(0xFF692729), // Deep brown icon color
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Verma Aldit D.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'PenggunaSekitar@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionsList() {
    return Expanded(
      child: ListView(
        children: [
          buildListTile(
            icon: Icons.person,
            title: 'My Profile',
            onTap: () {
              // Navigate to My Profile screen
            },
          ),
          const Divider(),
          buildListTile(
            icon: Icons.volunteer_activism,
            title: 'Donation',
            onTap: () {
              // Navigate to Donation screen
            },
          ),
          const Divider(),
          buildListTile(
            icon: Icons.location_on,
            title: 'My Address',
            onTap: () {
              // Inisialisasi MyAddressController
              Get.lazyPut(() => MyAddressController());
              // Navigasi ke halaman MyAddressView
              Get.to(() => const MyAddressView());
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF4E342E)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}
