import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/providers/dashboard_provider.dart';
import 'package:e_waris/views/assets/assets_screen.dart';
import 'package:e_waris/views/nominees/nominee_screen.dart';
import 'package:e_waris/views/settings/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifications_screen.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);

    final List<Widget> screens = [
      const AssetsScreen(),
      const NomineeScreen(),
      const NotificationsScreen(),
      const SettingScreen(),
    ];

    return Scaffold(
      body: screens[provider.currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: provider.changeIndex,

        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkGrey,

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: "Assets",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: "Nominees",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "Notifications",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}