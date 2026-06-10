import 'package:e_waris/core/constants/app_colors.dart';
import 'package:e_waris/view_models/dashboard_provider.dart';
import 'package:e_waris/views/widgets/custom_asset_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/asset_provider.dart';
import '../view_models/home_provider.dart';

class DashboardScreen extends StatelessWidget {
   const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final assetProvider = Provider.of<AssetProvider>(context);

    final assets = assetProvider.assets;

    // safe recent 3 assets
    final recentAssets = assets.length > 3
        ? assets.sublist(0, 3)
        : assets;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                const Text(
                  'Welcome, 👋',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Manage your digital legacy securely.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Stats Row
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.folder_copy_outlined,
                        iconBgColor: const Color(0xFFE8F0FF),
                        iconColor: const Color(0xFF3B6EF8),
                        value: assets.length.toString(),
                        label: 'Total Assets',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.group_outlined,
                        iconBgColor: const Color(0xFFE6F9F0),
                        iconColor: const Color(0xFF2DB87C),
                        value: '3',
                        label: 'Total Nominees',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Legacy Status Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2DB87C),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shield_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Legacy Status',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'All assets have at least one\nassigned nominee.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F9F0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Protected',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF2DB87C),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Recent Assets Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Assets',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.read<HomeProvider>().changeIndex(1),
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),


                // ── Asset List ──
                // ── LOADING / EMPTY / LIST ──
                if (assetProvider.isLoading && assets.isEmpty)
                  const Center(child: CircularProgressIndicator())
                else if (assets.isEmpty)
                  const Center(child: Text("No assets found"))
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recentAssets.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final asset = recentAssets[index];
                      return CustomAssetCard(asset: asset);
                    },
                  ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Helper Widgets ───────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}