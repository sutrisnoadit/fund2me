import 'package:flutter/material.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adding an animated icon
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              child: Icon(
                Icons.wifi_off,
                size: 100,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 30), // Larger space between icon and text
            // Main title with bold font
            Text(
              'No Internet Connection',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 15), // Space between main text and description
            // Informational text with a softer font style
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Please check your connection and try again. If the issue persists, restart your device.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 40), // Space for the retry button
            // Retry button with rounded corners and padding
            ElevatedButton(
              onPressed: () {
                // Retry logic can go here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
