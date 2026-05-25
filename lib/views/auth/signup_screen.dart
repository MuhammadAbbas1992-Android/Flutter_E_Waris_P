import 'package:e_waris/view_models/auth/auth_provider.dart';
import 'package:e_waris/views/dashboard_screen.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:e_waris/views/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_fonts.dart';
import '../../routes/routs_name.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final emailController = TextEditingController(text: 'abc123@gmail.com');
    final passwordController = TextEditingController(text: '123456');
    final confirmPasswordController = TextEditingController(text: '123456');

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
              CustomTextField(
                hintText: 'your@email.com',
                controller: emailController, validator: (value) {  },
              ),

              const SizedBox(height: 20),

              // Password Field
              const CustomText(
                text: 'Password',
                fontFamily: AppFonts.robotoMedium,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: '********',
                controller: passwordController,
                obscureText: !authProvider.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    authProvider.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                    color: AppColors.primary,
                  ),
                  onPressed: () => authProvider.togglePasswordVisibility(),
                ), validator: (value) {  },
              ),

              // Confirm Password Field
              const CustomText(
                text: 'Confirm Password',
                fontFamily: AppFonts.robotoMedium,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                hintText: '********',
                controller: confirmPasswordController,
                obscureText: !authProvider.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    authProvider.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off_outlined,
                    color: AppColors.primary,
                  ),
                  onPressed: () => authProvider.togglePasswordVisibility(),
                ), validator: (value) {  },
              ),
              const SizedBox(height: 16),

              // Login Button
              CustomButton1(
                isLoading: authProvider.isLoading,
                btnText: 'Sign Up',
                onPressed: () async {
                  bool success = await authProvider.login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  if (success) {
                    Navigator.pushNamed(context, RoutsName.loginScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid email or password'),
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "or",
                      style: TextStyle(color: AppColors.darkGrey),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),

              // Signup Link
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.robotoSemiBold,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: '  Login',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontFamily: AppFonts.robotoSemiBold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
