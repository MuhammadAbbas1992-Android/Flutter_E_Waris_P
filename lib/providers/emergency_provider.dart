import 'package:flutter/material.dart';

class EmergencyProvider with ChangeNotifier {
  // Nominee State
  String _fullName = '';
  String _emailAddress = '';
  String _phoneNumber = '';
  String _relationship = 'Sister'; // Default value

  // Emergency Message State
  String _emergencyMessage =
      'If something happens to me, please check my digital assets and follow the instructions carefully.';

  // Inactivity Settings State
  int _checkEveryDays = 15; // Default selected matching design
  bool _isInactivityTriggerEnabled = true;

  // Getters
  String get fullName => _fullName;
  String get emailAddress => _emailAddress;
  String get phoneNumber => _phoneNumber;
  String get relationship => _relationship;
  String get emergencyMessage => _emergencyMessage;
  int get checkEveryDays => _checkEveryDays;
  bool get isInactivityTriggerEnabled => _isInactivityTriggerEnabled;

  // Actions
  void updateNominee({
    required String name,
    required String email,
    required String phone,
    required String relationship,
  }) {
    _fullName = name;
    _emailAddress = email;
    _phoneNumber = phone;
    _relationship = relationship;
    notifyListeners();
  }

  void updateEmergencyMessage(String message) {
    _emergencyMessage = message;
    notifyListeners();
  }

  void setInactivityDays(int days) {
    _checkEveryDays = days;
    notifyListeners();
  }

  void toggleInactivityTrigger(bool value) {
    _isInactivityTriggerEnabled = value;
    notifyListeners();
  }

  void handleAliveCheckConfirmation() {
    // Implement API/background sync actions here
    debugPrint("User confirmed active state.");
  }
}