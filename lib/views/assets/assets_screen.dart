import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../core/contants/app_colors.dart';
import '../../core/contants/app_fonts.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assets = [
      {
        "title": "Bank Account",
        "subtitle": "HBL Savings Account",
      },
      {
        "title": "Property",
        "subtitle": "Islamabad House",
      },
      {
        "title": "Vehicle",
        "subtitle": "Toyota Corolla",
      },
    ];

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
          itemCount: assets.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 14),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.inventory),
                ),

                title: CustomText(text: assets[index]["title"]!,),

                subtitle: CustomText(
                   text: assets[index]["subtitle"]!,
                ),

                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              ),
            );
          },
        ),
      ),
    );
  }
}
