import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fund2me1/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff692729),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Fund',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff2cebe),
                      ),
                    ),
                    TextSpan(
                      text: '2Me',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffeae4d6),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              const Text(
                'Create your Account',
                style: TextStyle(
                  color: Color(0xfff2cebe),
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                onChanged: controller.setEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Color(0xfff2cebe),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: controller.setPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Color(0xfff2cebe),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: controller.confirmPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Color(0xfff2cebe),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfff2cebe),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              SizedBox(height: 20),
              const Text(
                '_ or Sign in with _',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata_rounded),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.vpn_key),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
