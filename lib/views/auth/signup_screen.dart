import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/core/contants/app_fonts.dart';
import 'package:e_waris/providers/auth_providers.dart';
import 'package:e_waris/views/auth/login_screen.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:e_waris/views/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
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
                  controller: emailController,
                ),

                const SizedBox(height: 20),

                // Password Field
                const CustomText(
                  text: 'Password',
                  fontFamily: AppFonts.robotoMedium,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: '••••••••',
                  controller: passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      authProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.primary,
                    ),
                    onPressed: () => authProvider.togglePasswordVisibility(),
                  ),
                ),
                // Confirm Password Field
                const CustomText(
                  text: 'Confirm Password',
                  fontFamily: AppFonts.robotoMedium,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: '••••••••',
                  controller: passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      authProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: AppColors.primary,
                    ),
                    onPressed: () => authProvider.togglePasswordVisibility(),
                  ),
                ),
                const SizedBox(height: 16),

                // Login Button
                CustomButton1(isLoading: authProvider.isLoading, btnText: 'Sign Up',  onPressed: () => authProvider.login("test@gmail.con", "123456"),),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("or", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 24),

                // Signup Link
                Align(alignment: Alignment.center,
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
                                  builder: (context) => const LoginScreen(),
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
      ),
    );
  }
}
