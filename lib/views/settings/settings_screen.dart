import 'package:e_waris/core/constants/app_colors.dart';
import 'package:e_waris/routes/routs_name.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_dialog.dart';
import '../widgets/custom_webview.dart';
import 'notify_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _monitoringEnabled = true;

  // ── Logout Dialog ──────────────────────────────────────────────────────────
  void _showLogoutDialog() {
    CustomDialog(title: "Logout", message: "Are you sure you want to logout?", confirmLabel: "Logout",confirmLabelColor: AppColors.red,).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Title ──
                    CustomText(text: "Settings", fontSize: 28, fontWeight: FontWeight.w800, fontColor: AppColors.black87),
                    const SizedBox(height: 24),

                    // ── ACCOUNT ──
                    CustomText(text: 'ACCOUNT', fontWeight: FontWeight.w600,fontSize: 12, fontColor: Color(0xFF9AA0B8),),

                    const SizedBox(height: 8),
                    _SettingsCard(
                      children: [
                        _AccountTile(
                          name: 'Hamza',
                          email: 'hamza@gmail.com',
                          onTap: () => Navigator.pushNamed(context, RoutsName.profileScreen),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── SECURITY ──
                    CustomText(text: 'SECURITY', fontWeight: FontWeight.w600,fontSize: 12, fontColor: Color(0xFF9AA0B8),),

                    const SizedBox(height: 8),
                    _SettingsCard(
                      children: [
                        _SettingsTile(
                          icon: Icons.lock_outline,
                          iconBg: const Color(0xFFE8EDFB),
                          iconColor: AppColors.primary,
                          title: 'Change Password',
                          onTap: () => Navigator.pushNamed(context, RoutsName.changePasswordScreen),

                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── INACTIVITY ──
                    CustomText(text: 'INACTIVITY', fontWeight: FontWeight.w600,fontSize: 12, fontColor: Color(0xFF9AA0B8),),

                    const SizedBox(height: 8),
                    _SettingsCard(
                      children: [
                        // Monitoring toggle
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 13),
                          child: Row(
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE6F9EE),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.access_time_outlined,
                                    color: Color(0xFF2DB87C), size: 22),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Monitoring',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      _monitoringEnabled
                                          ? 'Inactivity monitoring is enabled'
                                          : 'Inactivity monitoring is disabled',
                                      style: const TextStyle(
                                          fontSize: 12, color: AppColors.darkGrey),
                                    ),
                                  ],
                                ),
                              ),
                              Switch(
                                value: _monitoringEnabled,
                                onChanged: (val) =>
                                    setState(() => _monitoringEnabled = val),
                                activeColor: Colors.white,
                                activeTrackColor: AppColors.primary,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: const Color(0xFFD0D5E8),
                              ),
                            ],
                          ),
                        ),

                        _Divider(),

                        // Notify After
                        // Notify After
                        _SettingsTile(
                          icon: Icons.notifications_outlined,
                          iconBg: const Color(0xFFEEEBFF),
                          iconColor: const Color(0xFF7B5FDB),
                          title: 'Notify After',
                          subtitle: 'Nominee will be notified after',
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                '30 Days',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.chevron_right,
                                  color: Color(0xFFB0B5C8), size: 20),
                            ],
                          ),
                          onTap: () =>  NotifyScreen.show(context),
                          showChevron: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── LEGAL ──
                    CustomText(text: 'LEGAL', fontWeight: FontWeight.w600,fontSize: 12, fontColor: Color(0xFF9AA0B8),),

                    const SizedBox(height: 8),
                    _SettingsCard(
                      children: [
                        _SettingsTile(
                          icon: Icons.verified_user_outlined,
                          iconBg: const Color(0xFFE6F9EE),
                          iconColor: const Color(0xFF2DB87C),
                          title: 'Privacy Policy',
                          onTap:() =>  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LocalHtmlViewer(
                                assetPath: 'assets/HTML/privacy.html',
                              ),
                            ),
                          ),
                        ),
                        _Divider(),
                        _SettingsTile(
                          icon: Icons.description_outlined,
                          iconBg: const Color(0xFFE8EDFB),
                          iconColor: AppColors.primary,
                          title: 'Terms & Conditions',
                            onTap:() =>  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LocalHtmlViewer(
                                  assetPath: 'assets/HTML/terms_conditions.html',
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── ABOUT ──
                    CustomText(text: 'ABOUT', fontWeight: FontWeight.w600,fontSize: 12, fontColor: Color(0xFF9AA0B8),),
                    const SizedBox(height: 8),
                    _SettingsCard(
                      children: [
                        _SettingsTile(
                          icon: Icons.info_outline,
                          iconBg: const Color(0xFFFFF8E6),
                          iconColor: const Color(0xFFF5A623),
                          title: 'Digital Estate Manager',
                          subtitle: 'Version 1.0.0',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ── Logout Button ──
                    GestureDetector(
                      onTap: _showLogoutDialog,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0F0),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: const Color(0xFFFFCDD2), width: 1.5),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout_rounded,
                                color: Colors.red, size: 22),
                            SizedBox(width: 8),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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



// ─── Settings Card ────────────────────────────────────────────────────────────

class _SettingsCard extends StatelessWidget {
  final List<Widget> children;
  const _SettingsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

// ─── Account Tile ─────────────────────────────────────────────────────────────

class _AccountTile extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback onTap;

  const _AccountTile({
    required this.name,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFE8EDFB),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline,
                color: AppColors.primary,
                size: 26,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: name,fontSize: 16,fontWeight: FontWeight.w700, fontColor: AppColors.black87,),
                  const SizedBox(height: 2),
                  CustomText(text: email,fontSize: 13,fontWeight: FontWeight.w700, fontColor: Color(0xFF8A8FA8),),

                ],
              ),
            ),
            const Icon(Icons.chevron_right,
                color: Color(0xFFB0B5C8), size: 22),
          ],
        ),
      ),
    );
  }
}

// ─── Settings Tile ────────────────────────────────────────────────────────────

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final bool showChevron;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.trailing,
    this.showChevron = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF8A8FA8)),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null)
              trailing!
            else if (showChevron)
              const Icon(Icons.chevron_right,
                  color: Color(0xFFB0B5C8), size: 22),
          ],
        ),
      ),
    );
  }
}

// ─── Divider ──────────────────────────────────────────────────────────────────

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 70,
      endIndent: 0,
      color: Color(0xFFF0F2FA),
    );
  }
}

// ─── Bottom Navigation Bar ────────────────────────────────────────────────────
