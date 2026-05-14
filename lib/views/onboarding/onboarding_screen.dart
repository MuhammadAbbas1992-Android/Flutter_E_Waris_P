import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/views/widgets/button1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/contants/app_fonts.dart';
import '../../data/sources/onboarding_data.dart';
import '../../providers/onboarding_provider.dart';
import '../widgets/custom_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnboardingProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Column(
              children: [
                /// PageView
                Expanded(
                  child: PageView.builder(
                    controller: provider.pageController,

                    itemCount: onboardingList.length,

                    onPageChanged: provider.onPageChanged,

                    itemBuilder: (context, index) {
                      final item = onboardingList[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),

                        child: Column(
                          children: [
                            const SizedBox(height: 200),

                            /// Image
                            Image.asset(item.image, height: 250),

                            const SizedBox(height: 30),

                            /// Title
                            CustomText(
                              text: item.title,
                              fontFamily: AppFonts.robotoExtraBold,
                              textAlign: TextAlign.center,
                              fontSize: 38,
                            ),

                            const SizedBox(height: 20),

                            /// Description
                            CustomText(
                              text: item.description,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// Bottom Area
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      /// Skip
                      TextButton(
                        onPressed: () {},
                        child: CustomText(text: 'Skip'),
                      ),

                      /// Indicator
                      SmoothPageIndicator(
                        controller: provider.pageController,
                        count: onboardingList.length,

                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: AppColors.primary,
                          dotColor: AppColors.grey,
                        ),
                      ),

                      /// Next Button
                      Button1(
                        btnText: provider.currentIndex == 2
                            ? "Get Started"
                            : "Next",
                        btnWidth: provider.currentIndex == 2 ? .4 : .2,
                        onPress: () {
                          if (provider.currentIndex == 2) {
                            /// Navigate
                            /// Login Screen
                          } else {
                            provider.nextPage();
                          }
                        }       ),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
