import 'dart:async';
import 'package:e_waris/routes/routs_name.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutsName.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash.jpeg',width: 250),
                const SizedBox(height: 50),
                CustomText(
                  text: 'Digital Estate \nManager',
                  fontFamily: AppFonts.robotoBold,
                  textAlign: TextAlign.center,
                  fontSize: 30,
                  fontColor: AppColors.primary,
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: 'Your digital life,\n secured beyond you.',
                  textAlign: TextAlign.center,
                  fontSize: 18,
                  fontColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}