import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart'; // Paket untuk pemutar audio
import 'package:fund2me1/app/modules/maps/controllers/maps_controller.dart';
import 'package:fund2me1/app/modules/maps/views/maps_view.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/setting_controller.dart';
import 'package:fund2me1/app/modules/my_address/controllers/my_address_controller.dart'; // Import controller MyAddress
import 'package:fund2me1/app/modules/my_address/views/my_address_view.dart'; // Import halaman MyAddressView

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
          icon: const Icon(Icons.music_note, color: Colors.white),
          onPressed: () {
            _showMusicDialog(context); // Dialog untuk input URL musik
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
    return Column(
      children: [
        Stack(
          children: [
            Obx(() {
              return CircleAvatar(
                radius: 100,
                backgroundImage: controller.profileImagePath.value.isEmpty
                    ? const AssetImage('assets/img/hilma.png')
                        as ImageProvider
                    : FileImage(File(controller.profileImagePath.value)),
              );
            }),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () => _showImagePickerOptions(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color(0xFF692729), // Warna coklat
                    size: 20,
                  ),
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
    );
  }

  void _showImagePickerOptions() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Pick from Gallery"),
              onTap: () {
                Get.back();
                controller.pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a Photo"),
              onTap: () {
                Get.back();
                controller.pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
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
          const Divider(),
          buildListTile(
            icon: Icons.map_sharp,
            title: 'Maps',
            onTap: () {
              // Inisialisasi MyAddressController
              Get.lazyPut(() => MapsController());
              // Navigasi ke halaman MyAddressView
              Get.to(() => const MapsView());
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

  /// Dialog untuk memutar musik dari URL
  void _showMusicDialog(BuildContext context) {
    final TextEditingController urlController = TextEditingController();
    final AudioPlayer audioPlayer = AudioPlayer();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Play Ur Music'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: urlController,
                decoration: const InputDecoration(
                  hintText: 'Enter music URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      String url = urlController.text.trim();
                      if (url.isNotEmpty) {
                        await audioPlayer.play(UrlSource(url)); // Mulai memutar musik
                      } else {
                        Get.snackbar('Error', 'Please enter a valid URL');
                      }
                    },
                    child: const Text('Play'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await audioPlayer.pause(); // Pause musik
                    },
                    child: const Text('Pause'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await audioPlayer.stop(); // Stop musik
                    },
                    child: const Text('Stop'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                audioPlayer.dispose(); // Bersihkan resource player saat dialog ditutup
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

