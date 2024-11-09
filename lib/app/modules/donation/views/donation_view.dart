import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/donation_controller.dart';

class DonationView extends GetView<DonationController> {
  const DonationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DonationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DonationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
