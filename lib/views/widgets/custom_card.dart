import 'package:flutter/material.dart';

import '../../data/models/asset_model.dart';
import 'custom_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.assets,
  });

  final AssetModel assets;
  // final NomineeModel? nominees;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),

      child: ListTile(
        leading:  CircleAvatar(
          child: Icon(Icons.inventory),
        ),

        title: CustomText(text: assets.platformName),

        subtitle: CustomText(
          text: assets.category!,
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}