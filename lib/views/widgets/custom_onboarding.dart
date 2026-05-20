import 'package:flutter/cupertino.dart';
import '../../core/constants/app_fonts.dart';
import '../../data/models/onboarding_model.dart';
import 'custom_text.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({
    super.key,
    required this.item,
  });

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        children: [
          /// Image
          Expanded(child: Align (alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset(item.image,width: 250),)),
          const SizedBox(height: 70),
          /// Title
          CustomText(
            text: item.title,
            fontFamily: AppFonts.robotoBold,
            textAlign: TextAlign.center,
            fontSize: 30,
          ),
          const SizedBox(height: 20),
          /// Description
          CustomText(
            text: item.description,
            textAlign: TextAlign.center,
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}
