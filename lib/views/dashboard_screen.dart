import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_waris/view_models/dashboard_provider.dart';
import 'package:e_waris/views/assets/assets_screen.dart';
import 'package:e_waris/views/nominees/nominee_screen.dart';
import 'package:e_waris/views/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_colors.dart';
import 'notifications_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
    final provider = Provider.of<DashboardProvider>(context);

    final List<Widget> screens = [
      const AssetsScreen(),
      const NomineesScreen(),
      const NotificationsScreen(),
      const SettingScreen(),
    ];

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.white,
          color: AppColors.primary,
          key: bottomNavigationKey,
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.inventory_2_outlined,color: AppColors.white,), label: "Assets",labelStyle: TextStyle(fontSize: 10,color: AppColors.white)),
            CurvedNavigationBarItem(
              child: Icon(Icons.people_outline,color: AppColors.white,), label: "Nominees",labelStyle: TextStyle(fontSize: 10,color: AppColors.white,)),
            CurvedNavigationBarItem(
              child: Icon(Icons.notifications_none,color: AppColors.white,), label: "Notifications",labelStyle: TextStyle(fontSize: 10,color: AppColors.white,)),
            CurvedNavigationBarItem(
              child: Icon(Icons.settings_outlined,color: AppColors.white,), label: "Settings",labelStyle: TextStyle(fontSize: 10,color: AppColors.white,)),
          ],
          index: provider.currentIndex,
          onTap: provider.changeIndex,
          animationCurve: Curves.easeInCubic,
        ),
        body: Container(color: AppColors.primary,
          child: screens[provider.currentIndex]
        ));
    }
}
