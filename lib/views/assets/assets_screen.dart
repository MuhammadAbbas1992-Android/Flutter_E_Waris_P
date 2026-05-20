import 'package:e_waris/data/sources/asset_data.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_fonts.dart';
import '../widgets/custom_card.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Assets',
          fontFamily: AppFonts.robotoExtraBold,
          fontSize: 20,
          fontColor: AppColors.primary,
        ),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add,color: AppColors.white,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: assetsList.length,
          itemBuilder: (context, index) {
            return CustomCard(assets: assetsList[index]);
          },
        ),
      ),
    );
  }
}


