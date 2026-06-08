import 'package:e_waris/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color _primaryBlue = Color(0xFF3B5BDB);
  static const Color _bgColor = Color(0xFFF4F6FB);
  static const Color _textDark = Color(0xFF1A1A2E);
  static const Color _textGrey = Color(0xFF8A8FA8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: _textDark, size: 24),
                    ),
                  ),
                  const Text(
                    'Profile Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _textDark,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // ── Avatar ──
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDDE4F8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: _primaryBlue,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -2,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: const Color(0xFFE8EDFB), width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.edit,
                                  size: 14, color: _primaryBlue),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ── Name & Email ──
                    const Text(
                      'Hamza',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: _textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'hamza@gmail.com',
                      style: TextStyle(fontSize: 14, color: _textGrey),
                    ),
                    const SizedBox(height: 28),

                    // ── Account Information Card ──
                    Container(
                      width: double.infinity,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Text(
                              'Account Information',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: _textGrey,
                              ),
                            ),
                          ),
                          _ProfileInfoTile(
                            icon: Icons.person_outline,
                            label: 'Full Name',
                            value: 'Hamza',
                            showChevron: true,
                            onTap: () {},
                          ),
                          _ProfileDivider(),
                          _ProfileInfoTile(
                            icon: Icons.email_outlined,
                            label: 'Email Address',
                            value: 'hamza@gmail.com',
                          ),
                          _ProfileDivider(),
                          _ProfileInfoTile(
                            icon: Icons.calendar_today_outlined,
                            label: 'Account Created',
                            value: '12 June 2026',
                          ),
                          _ProfileDivider(),
                          _ProfileInfoTile(
                            icon: Icons.shield_outlined,
                            label: 'Account Type',
                            value: 'Standard',
                            isLast: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Update Profile Button ──
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(Icons.edit_outlined,
                            color: Colors.white, size: 20),
                        label: const Text(
                          'Update Profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
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

// ─── Profile Info Tile ────────────────────────────────────────────────────────

class _ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showChevron;
  final bool isLast;
  final VoidCallback? onTap;

  const _ProfileInfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.showChevron = false,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 14, 16, isLast ? 16 : 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: const Color(0xFF3B5BDB)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xFF8A8FA8)),
                  ),
                ],
              ),
            ),
            if (showChevron)
              const Icon(Icons.chevron_right,
                  color: Color(0xFFB0B5C8), size: 20),
          ],
        ),
      ),
    );
  }
}

// ─── Divider ──────────────────────────────────────────────────────────────────

class _ProfileDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
        height: 1, thickness: 1, indent: 52, color: Color(0xFFF0F2FA));
  }
}