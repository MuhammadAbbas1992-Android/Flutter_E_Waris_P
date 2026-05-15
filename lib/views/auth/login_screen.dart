import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/core/contants/app_fonts.dart';
import 'package:e_waris/providers/auth_providers.dart';
import 'package:e_waris/views/auth/signup_screen.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:e_waris/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                const SizedBox(height: 180),
                Align(
                  alignment: Alignment.center,
                  child: const CustomText(
                    text: 'Login',
                    fontFamily: AppFonts.robotoExtraBold,
                    fontSize: 20,
                    fontColor: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 30),

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
                      color: Colors.grey,
                    ),
                    onPressed: () => authProvider.togglePasswordVisibility(),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: CustomText(text: 'Forgot Password?',fontFamily: AppFonts.robotoMedium, fontColor: AppColors.primary,),
                  ),
                ),
                const SizedBox(height: 16),

                // Login Button
                CustomButton1(isLoading: authProvider.isLoading, btnText: 'Login',  onPressed: () => authProvider.login("test@gmail.con", "123456"),),
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

                // Signup Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Create New Account",
                      style: TextStyle(color: Color(0xFF1E61D8), fontSize: 15),
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
