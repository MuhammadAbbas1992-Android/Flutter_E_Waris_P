import 'package:e_waris/routes/routs_name.dart';
import 'package:e_waris/view_models/auth/auth_provider.dart';
import 'package:e_waris/views/auth/signup_screen.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:e_waris/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_fonts.dart';
import '../../core/utils/app_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final emailController = TextEditingController(text: 'abc123@gmail.com');
    final passwordController = TextEditingController(text: '123456');
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                CustomTextField(
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
                CustomTextField(
                  hintText: '********',
                  controller: passwordController,
                  validator: (value) => AppUtils.validatePassword(value),
                  obscureText: !authProvider.isPasswordVisible,
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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
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
                    if (_formKey.currentState!.validate()) {
                      bool success = await authProvider.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if (success) {
                        Navigator.pushNamed(context, RoutsName.dashboardScreen);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login failed')),
                        );
                      }
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
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppFonts.robotoSemiBold,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: '  Sign Up',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: AppFonts.robotoSemiBold,
                          ),

                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
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
