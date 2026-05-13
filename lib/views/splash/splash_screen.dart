import 'dart:async';
import 'package:e_waris/core/utils/app_utils.dart';
import 'package:e_waris/views/widgets/button1.dart';
import 'package:e_waris/views/widgets/button2.dart';
import 'package:e_waris/views/widgets/custom_list_tile.dart';
import 'package:e_waris/views/widgets/custom_text_field.dart';
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
      /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );*/
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
                SvgPicture.asset(
                  'assets/icons/lock.svg',
                 width: 200,
                  height: 200,
                  colorFilter: const ColorFilter.mode(
                    Colors.blue,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 20),
                 Text(
                  'Your Digital Assets Matters',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge
                               ),
                const SizedBox(height: 20),
                Text(
                    'Your digital life,\n secured beyond you.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall
                ),
                const SizedBox(height: 20),
                Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium
                ),
                const SizedBox(height: 10),
                Text(
                    'Binance',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall
                ),
                const SizedBox(height: 10),
                Text(
                    'Email',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge
                ),
                const SizedBox(height: 10),
                Text(
                    'Username/Email',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium
                ),
                const SizedBox(height: 10),
                Text(
                    'No more nominees added',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall
                ),
                const SizedBox(height: 10),
                Text(
                    'If Something happens to me',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge
                ),
                const SizedBox(height: 10),
                Text(
                    'Add a trusted contact',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium
                ),
                const SizedBox(height: 10),
                Text(
                    'hintStyle',
                    textAlign: TextAlign.center,
                    style: AppUtils.hintStyle
                ),
                const SizedBox(height: 10),
                CustomTextField(hintText: 'ABC', controller: TextEditingController()),
                const SizedBox(height: 10),
                Button1(btnText: 'Add Nominee'),
                const SizedBox(height: 10),
                Button2(btnText: 'Delete'),
                CustomListTile()
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

