import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_waris/data/models/nominee_model.dart';
import 'package:e_waris/view_models/home_provider.dart';
import 'package:e_waris/views/assets/assets_screen.dart';
import 'package:e_waris/views/dashboard_screen.dart';
import 'package:e_waris/views/nominees/nominee_screen.dart';
import 'package:e_waris/views/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_colors.dart';
import '../core/utils/app_utils.dart';
import '../view_models/asset_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final assetProvider =
      Provider.of<AssetProvider>(context, listen: false);
      /*final nomineeProvider =
      Provider.of<NomineeModel>(context, listen: false);*/

      assetProvider.init(AppUtils.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
    final provider = Provider.of<HomeProvider>(context);

    final List<Widget> screens = [
      const DashboardScreen(),
      const AssetsScreen(),
      const NomineesScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColors.white,
          color: AppColors.primary,
          key: bottomNavigationKey,
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.dashboard_customize_outlined,color: AppColors.white,), label: "Dashboard",labelStyle: TextStyle(fontSize: 10,color: AppColors.white)),
            CurvedNavigationBarItem(
              child: Icon(Icons.inventory_2_outlined,color: AppColors.white,), label: "Assets",labelStyle: TextStyle(fontSize: 10,color: AppColors.white,)),
            CurvedNavigationBarItem(
              child: Icon(Icons.people_outline,color: AppColors.white,), label: "Nominees",labelStyle: TextStyle(fontSize: 10,color: AppColors.white,)),
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
