import 'package:flutter/material.dart';
import 'package:fund2me1/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff692729),  
        body: Fund4MeScreen(),
      ),
    );
  }
}
class Fund4MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 2), 
          Column(
            children: [
             Image.asset(
                'assets/img/png/logo-no-background.png', 
              ),
              SizedBox(height: screenHeight * 0.09), 
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
             
            ],
          ),
          SizedBox(height: screenHeight * 0.05), 

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.25,
                vertical: screenHeight * 0.02,
              ), 
              backgroundColor: Color(0xfff2cebe), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), 
              ),
              elevation: 5, 
            ),
            onPressed: () =>  Get.toNamed(Routes.SIGNIN),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xff692729), 
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: screenWidth * 0.02), 
          
              ],
            ),
          ),

          Spacer(flex: 3), 

          Text(
            'When we give cheerfully and accept gracefully\neveryone is blessed',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.035, 
              color: Colors.white70,
            ),
          ),
          SizedBox(height: screenHeight * 0.02), 

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, size: screenWidth * 0.025, color: Colors.white70), 
              SizedBox(width: screenWidth * 0.02), 
              Icon(Icons.circle, size: screenWidth * 0.025, color: Colors.white38),
            ],
          ),
          SizedBox(height: screenHeight * 0.02), 
        ],
      ),
    );
  }
}