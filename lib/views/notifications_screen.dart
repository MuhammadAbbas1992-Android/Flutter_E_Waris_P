import 'package:e_waris/view_models/notifications_provider.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationsProvider>(context);

    final notifications = [
      {
        "title": "Inactivity Alert",
        "subtitle":
        "Hamza has been inactive for 15 days. Please check their digital assets.",
        "time": "Just now",
        "icon": Icons.warning_amber_rounded,
        "color": AppColors.red,
      },

      {
        "title": "System Notification",
        "subtitle":
        "You have been added as a trusted contact.",
        "time": "2 days ago",
        "icon": Icons.notifications,
        "color": AppColors.blue,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Notifications',
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

            ///////////////////////////////////////////////////////////////
            // TABS
            ///////////////////////////////////////////////////////////////

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                provider.tabs.length,
                    (index) {
                  final isSelected =
                      provider.selectedTab == index;

                  return GestureDetector(
                    onTap: () {
                      provider.changeTab(index);
                    },

                    child: Column(
                      children: [
                        Text(
                          provider.tabs[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.darkGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Container(
                          width: 70,
                          height: 2,
                          color: isSelected
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            ///////////////////////////////////////////////////////////////
            // LIST
            ///////////////////////////////////////////////////////////////

            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {

                  final item = notifications[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: ListTile(
                      contentPadding: const EdgeInsets.all(14),

                      leading: CircleAvatar(
                        backgroundColor:
                        item["color"] as Color,

                        child: Icon(
                          item["icon"] as IconData,
                          color: Colors.white,
                        ),
                      ),

                      title: Text(
                        item["title"].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          item["subtitle"].toString(),
                        ),
                      ),

                      trailing: Text(
                        item["time"].toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
