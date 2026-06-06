import 'package:e_waris/core/constants/app_colors.dart';
import 'package:e_waris/data/models/nominee_model.dart';
import 'package:flutter/material.dart';
class NomineesScreen extends StatelessWidget {
  const NomineesScreen({super.key});

  static const Color _primaryBlue = Color(0xFF3B5BDB);
  static const Color _bgColor = Color(0xFFF4F6FB);
  static const Color _textDark = Color(0xFF1A1A2E);

  List<NomineeModel> get _nominees => [
    NomineeModel(
      name: 'Ali Khan',
      relation: 'Brother',
      email: 'ali@gmail.com',
      phone: '+92 300 1234567',
      avatarBg: AppColors.lightGrey,
      avatarIconColor: const Color(0xFF3B5BDB),
      relationBadgeBg: const Color(0xFFE8EDFB),
      relationBadgeText: const Color(0xFF3B5BDB), id: '',
    ),
    NomineeModel(
      name: 'Ahmed Raza',
      relation: 'Friend',
      email: 'ahmedraza@gmail.com',
      phone: '+92 321 1111111',
      avatarBg: AppColors.lightGrey,
      avatarIconColor: const Color(0xFFE05C5C),
      relationBadgeBg: const Color(0xFFE6F9EE),
      relationBadgeText: const Color(0xFF2DB87C), id: '',
    ),
    NomineeModel(
      name: 'Sara Khan',
      relation: 'Wife',
      email: 'sarakhan@gmail.com',
      phone: '+92 310 9876543',
      avatarBg: const Color(0xFFFFEDE6),
      avatarIconColor: const Color(0xFFE07840),
      relationBadgeBg: const Color(0xFFFFEDE6),
      relationBadgeText: const Color(0xFFE07840), id: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Nominees',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: _textDark,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: _primaryBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ── Info Banner ──
              _InfoBanner(
                icon: Icons.people_outline,
                iconColor: _primaryBlue,
                iconBg: const Color(0xFFE8EDFB),
                text: 'These trusted contacts will be notified\nif you become inactive.',
              ),
              const SizedBox(height: 14),

              // ── Nominee List ──
              Expanded(
                child: ListView.separated(
                  itemCount: _nominees.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return _NomineeCard(nominee: _nominees[index]);
                  },
                ),
              ),
              const SizedBox(height: 14),

              // ── Bottom Note ──
              _InfoBanner(
                icon: Icons.lock_outline,
                iconColor: _primaryBlue,
                iconBg: const Color(0xFFE8EDFB),
                text: "Your nominees' information is private and secure.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Info Banner ──────────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String text;

  const _InfoBanner({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF5A6080),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Nominee Card ─────────────────────────────────────────────────────────────

class _NomineeCard extends StatelessWidget {
  final NomineeModel nominee;

  const _NomineeCard({required this.nominee});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: nominee.avatarBg,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, color: nominee.avatarIconColor, size: 28),
            ),
            const SizedBox(width: 14),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + badge row
                  Row(
                    children: [
                      Text(
                        nominee.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Relation badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: nominee.relationBadgeBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      nominee.relation,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: nominee.relationBadgeText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Email
                  Row(
                    children: [
                      const Icon(Icons.email_outlined,
                          size: 14, color: Color(0xFF8A8FA8)),
                      const SizedBox(width: 6),
                      Text(
                        nominee.email,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF5A6080),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Phone
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined,
                          size: 14, color: Color(0xFF8A8FA8)),
                      const SizedBox(width: 6),
                      Text(
                        nominee.phone,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF5A6080),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right, color: Color(0xFFB0B5C8), size: 22),
          ],
        ),
      ),
    );
  }
}