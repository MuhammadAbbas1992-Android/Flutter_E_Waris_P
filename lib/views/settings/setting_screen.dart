import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = [
      {
        "title": "Change PIN",
        "icon": Icons.lock_outline,
      },

      {
        "title": "Enable Fingerprint / Face ID",
        "icon": Icons.fingerprint,
      },

      {
        "title": "Inactivity Settings",
        "icon": Icons.timer_outlined,
      },

      {
        "title": "Privacy Policy",
        "icon": Icons.privacy_tip_outlined,
      },

      {
        "title": "About Us",
        "icon": Icons.info_outline,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Settings',
          fontFamily: AppFonts.robotoExtraBold,
          fontSize: 20,
          fontColor: AppColors.primary,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: settings.length,
                itemBuilder: (context, index) {

                  final item = settings[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                        Colors.grey.shade200,

                        child: Icon(
                          item["icon"] as IconData,
                          color: Colors.black,
                        ),
                      ),

                      title: Text(
                        item["title"].toString(),
                      ),

                      trailing: index == 1
                          ? Switch(
                        value: true,
                        onChanged: (value) {},
                      )
                          : const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: OutlinedButton(
                onPressed: () {},

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.red,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}