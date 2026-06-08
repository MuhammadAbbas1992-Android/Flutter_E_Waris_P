import 'package:e_waris/routes/routs_name.dart';
import 'package:e_waris/view_models/auth/auth_provider.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:e_waris/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_fonts.dart';
import '../../core/utils/app_utils.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_rich_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final emailController = TextEditingController(text: 'abc123@gmail.com');
    final passwordController = TextEditingController(text: '123456');
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                Align(
                  alignment: Alignment.center,
                  child: const CustomText(
                    text: 'Login',
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
                const SizedBox(height: 20),

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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, RoutsName.forgotPasswordScreen),
                    child: CustomText(
                      text: 'Forgot Password?',
                      fontFamily: AppFonts.robotoMedium,
                      fontColor: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Login Button
                CustomButton1(
                  isLoading: authProvider.isLoading,
                  btnText: 'Login',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      bool success = await authProvider.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (!context.mounted) return; // 🔥 FIX
                      if (success) {
                        Fluttertoast.showToast(msg: 'Login successful');
                        Navigator.pushNamed(context, RoutsName.homeScreen);
                      } else {
                        Fluttertoast.showToast(msg: 'Login failed'); }
                    }
                  },
                ),

                const SizedBox(height: 24),
                CustomDivider(color: AppColors.darkGrey,),
                const SizedBox(height: 24),

                // Signup Link
                CustomRichText(leftTextSpan: 'Don\'t have an account?',
                  rightTextSpan: '  Sign Up',
                  leftTextSpanColor: AppColors.black,
                  rightTextSpanColor: AppColors.primary,
                  onTap: () {
                  Navigator.pushNamed(context, RoutsName.signupScreen);},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


