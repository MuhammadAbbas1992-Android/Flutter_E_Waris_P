import 'package:e_waris/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/asset_model.dart';

class CustomAssetCard extends StatelessWidget {
  final AssetModel asset;

  const CustomAssetCard({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            SizedBox(width: 48, height: 48, child: asset.icon),
            const SizedBox(width: 14),

            // Name & category
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    asset.category,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8A8FA8),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.person_outline,
                          size: 14, color: Color(0xFF8A8FA8)),
                      const SizedBox(width: 4),
                      const Text(
                        'Assigned: ',
                        style: TextStyle(fontSize: 12, color: Color(0xFF8A8FA8)),
                      ),
                      Text(
                        asset.assignedTo,
                        style: TextStyle(
                          fontSize: 12,
                          color: asset.assignedColor,
                          fontWeight: FontWeight.w600,
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