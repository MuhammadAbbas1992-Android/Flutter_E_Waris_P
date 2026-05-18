import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../core/contants/app_colors.dart';
import '../../core/contants/app_fonts.dart';

class NomineeScreen extends StatelessWidget {
  const NomineeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nominees = [
      {
        "name": "Ali Hamza",
        "relation": "Brother",
      },
      {
        "name": "Ayesha Khan",
        "relation": "Sister",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Nominees',
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
          itemCount: nominees.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 14),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),

                title: Text(
                  nominees[index]["name"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  nominees[index]["relation"]!,
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