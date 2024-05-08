import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/Screens/Onboard_Screen/onboarding_screen1.dart';
import 'package:todo_app/utils/AppColor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onboarding1_Screen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image(
          image: const AssetImage('assets/images/Splash_Screen.png'),
          height: screenHeight * 0.300,
          width: screenWidth * 0.300,
        ),
      ),
    );;
  }
}