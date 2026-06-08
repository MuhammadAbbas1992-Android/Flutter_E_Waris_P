import 'package:e_waris/core/utils/app_utils.dart';
import 'package:e_waris/view_models/auth/forgot_password_provider.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _successAnimCtrl;
  late final Animation<double> _successFadeAnim;
  late final Animation<Offset> _successSlideAnim;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _successAnimCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _successFadeAnim = CurvedAnimation(
      parent: _successAnimCtrl,
      curve: Curves.easeOut,
    );
    _successSlideAnim = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _successAnimCtrl, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordScreen = Provider.of<ForgotPasswordProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ──────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.black87,
                        size: 24,
                      ),
                    ),
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // ── Body ─────────────────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(child: Image.asset('assets/images/splash.jpeg', width: 250)),
                    const SizedBox(height: 28),
                    // ── Title & Subtitle ──────────────────────────────────────
                    const Center(
                      child: Text(
                        'Reset your password',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Enter your email address and we'll send\nyou a password reset link.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.darkGrey,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // ── Email Field ───────────────────────────────────────────
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Form(key: formKey, child: CustomTextFormField(
                      hintText: 'Enter your email address',
                      controller: forgotPasswordScreen.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => AppUtils.validateEmail(value),
                      suffixIcon: forgotPasswordScreen.emailController.text.isNotEmpty
                          ?IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Color(0xFFB0B5C8),
                          size: 20,
                        ),
                        onPressed: () => forgotPasswordScreen.clearEmail(),)
                          : null,
                    )),
                    const SizedBox(height: 20),

                    // ── Send Reset Link Button ─────────────────────────────────
                    CustomButton1(
                      btnText: 'Send Reset Link',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await forgotPasswordScreen.sendEmailLink();
                            if (!context.mounted) return; // 🔥 FIX
                            if (forgotPasswordScreen.linkSent) {
                              _successAnimCtrl.forward();
                            } else {
                              AppUtils.showSnack(context: context, msg: 'Error to send email link');}
                          }
                        },


                    ),
                    const SizedBox(height: 20),

                    // ── Success Banner ────────────────────────────────────────
                    if (forgotPasswordScreen.linkSent)
                      FadeTransition(
                        opacity: _successFadeAnim,
                        child: SlideTransition(
                          position: _successSlideAnim,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF9F2),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: const Color(0xFFB2EDD4),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Password reset link sent successfully!',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Please check your email inbox and follow the instructions to reset your password.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF3A7D5E),
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 28),

                    // ── OR Divider ────────────────────────────────────────────
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFDDE3F0),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9AA0B8),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFDDE3F0),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ── Back to Login Button ──────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFFDDE3F0),
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                          size: 18,
                        ),
                        label: const Text(
                          'Back to Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _SparklePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3B5BDB).withOpacity(0.5)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final cx = size.width / 2;
    final cy = size.height / 2;
    // 4-point star lines
    canvas.drawLine(Offset(cx, 0), Offset(cx, size.height), paint);
    canvas.drawLine(Offset(0, cy), Offset(size.width, cy), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
