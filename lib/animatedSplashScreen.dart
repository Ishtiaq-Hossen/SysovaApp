import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hella/dashboardScreen.dart';
import 'package:hella/globalColors.dart';
import 'package:hella/logInScreen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        width: double.infinity, // Ensures it takes the full width
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevents overflow
            mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
            children: [
              Lottie.asset('assets/images/Animation - 1740302387201.json',
                  width: 250, height: 250), // Adjust size as needed
              // const SizedBox(height: 5), // Space between animation and text
              Text(
                'Welcome to Sysnova',
                textAlign: TextAlign.center, // Ensures text is centered
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ScaffholdColor,
                  fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
        ),
      ),
      nextScreen: DashboardPage(),
      duration: 1700,
      splashTransition: SplashTransition.fadeTransition,
      // backgroundColor: Colors.white,
      splashIconSize: double.infinity, // Allows the Column to fit properly
    );
  }
}
