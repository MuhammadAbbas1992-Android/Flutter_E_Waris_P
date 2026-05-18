

import 'package:flutter/cupertino.dart';

class NotificationsProvider extends ChangeNotifier {
  int selectedTab = 0;

  final List<String> tabs = ["All", "Alerts", "Info"];

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}