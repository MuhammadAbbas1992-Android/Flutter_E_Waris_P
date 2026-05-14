import 'dart:async';
import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/core/contants/app_fonts.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../onboarding/onboarding_screen.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash.jpeg'),
                const SizedBox(height: 20),
                CustomText(
                  text: 'Digital Estate Manager',
                  fontFamily: AppFonts.robotoExtraBold,
                  textAlign: TextAlign.center,
                   fontSize: 38,
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
