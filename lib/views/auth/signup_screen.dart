import 'package:e_waris/core/utils/app_utils.dart';
import 'package:e_waris/view_models/auth/auth_provider.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_fonts.dart';
import '../../routes/routs_name.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_rich_text.dart';
import '../widgets/custom_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              Align(
                alignment: Alignment.center,
                child: const CustomText(
                  text: 'Sign Up',
                  fontFamily: AppFonts.robotoExtraBold,
                  fontSize: 20,
                  fontColor: AppColors.primary,
                ),
              ),
              const SizedBox(height: 50),
              // Email Field
              const CustomText(
                text: 'Email',
                fontFamily: AppFonts.robotoMedium,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: 'your@email.com',
                controller: emailController,
                validator: (value) => AppUtils.validateEmail(value),
              ),
              // Password Field
              const CustomText(
                text: 'Password',
                fontFamily: AppFonts.robotoMedium,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(

                hintText: '********',
                controller: passwordController,
                obscureText: !authProvider.isPasswordVisible,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    authProvider.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                    color: AppColors.primary,
                  ),
                  onPressed: () => authProvider.togglePasswordVisibility(),
                ),
                validator: (value) => AppUtils.validatePassword(value),
              ),
              // Confirm Password Field
              const CustomText(
                text: 'Confirm Password',
                fontFamily: AppFonts.robotoMedium,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(

                hintText: '********',
                controller: confirmPasswordController,
                obscureText: !authProvider.isPasswordVisible,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    authProvider.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                    color: AppColors.primary,
                  ),
                  onPressed: () => authProvider.togglePasswordVisibility(),
                ),
                validator: (value) => AppUtils.validateConfirmPassword(value,passwordController.text.trim()),
              ),
              const SizedBox(height: 16),

              // Login Button
              CustomButton1(
                isLoading: authProvider.isLoading,
                btnText: 'Sign Up',
                onPressed: () async {
                  bool success = await authProvider.signUp(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  if (!context.mounted) return; // 🔥 FIX
                  if (success) {
                    Fluttertoast.showToast(msg: 'Signup successful');
                    Navigator.pushNamed(context, RoutsName.loginScreen);
                  } else {
                    Fluttertoast.showToast(msg: 'Failed to signup'); }
                },
              ),
              const SizedBox(height: 24),
              CustomDivider(color: AppColors.darkGrey,),
              const SizedBox(height: 24),

              // Login Link
              CustomRichText(leftTextSpan: 'Already have an account?',
                rightTextSpan: '  Login',
                leftTextSpanColor: AppColors.black,
                rightTextSpanColor: AppColors.primary,
                onTap: () {
                  Navigator.pushNamed(context, RoutsName.loginScreen);},),
            ],
          ),
        ),
      ),
    );
  }
}
