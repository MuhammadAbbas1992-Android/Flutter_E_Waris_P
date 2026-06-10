import 'package:e_waris/core/constants/app_colors.dart';
import 'package:e_waris/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/routs_name.dart';
import '../../view_models/asset_provider.dart';
import '../widgets/custom_asset_card.dart';
import '../widgets/info_banner.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  static const Color _primaryBlue = Color(0xFF3B5BDB);


  @override
  Widget build(BuildContext context) {
    final assetProvider = Provider.of<AssetProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        textColor: AppColors.primary,
        text: 'My Assets',
        onTap: () => Navigator.pushNamed(context, RoutsName.addEditAssetScreen),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Info Banner ──
              InfoBanner(
                icon: Icons.shield_outlined,
                iconColor: AppColors.primary,
                iconBg: const Color(0xFFE8EDFB),
                text:
                    'All your digital assets are encrypted\nand stored securely.',
              ),
              const SizedBox(height: 14),

              // ── Asset List ──
              Expanded(
                child: assetProvider.isLoading && assetProvider.assets.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : assetProvider.assets.isEmpty
                    ? const Center(
                  child: Text("No assets found"),
                )
                    : ListView.separated(
                  itemCount: assetProvider.assets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final asset = assetProvider.assets[index];
                    return CustomAssetCard(asset: asset,onTap: () => Navigator.pushNamed(context, RoutsName.addEditAssetScreen,arguments: asset.id));
                  },
                ),
              ),
              const SizedBox(height: 14),

              // ── Bottom Note ──
              InfoBanner(
                icon: Icons.lock_outline,
                iconColor: _primaryBlue,
                iconBg: const Color(0xFFE8EDFB),
                text: 'Tap on any asset to view or edit details.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
