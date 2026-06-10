import 'package:e_waris/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/nominee_model.dart';

class CustomNomineeCard extends StatelessWidget {
  final NomineeModel nominee;
  final VoidCallback? onTap;

  const CustomNomineeCard({super.key,
    required this.nominee,
    this.onTap,});

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
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: AppColors.white,
                size: 28,
              ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      nominee.relationship,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Email
                  Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 14,
                        color: Color(0xFF8A8FA8),
                      ),
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
                      const Icon(
                        Icons.phone_outlined,
                        size: 14,
                        color: Color(0xFF8A8FA8),
                      ),
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
