import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../data/models/asset_model.dart';
import '../data/models/nominee_model.dart';

class NomineeProvider extends ChangeNotifier {

  List<NomineeModel> get _nominees => [
    NomineeModel(
      name: 'Ali Khan',
      relation: 'Brother',
      email: 'ali@gmail.com',
      phone: '+92 300 1234567',
      avatarBg: AppColors.lightGrey,
      avatarIconColor: const Color(0xFF3B5BDB),
      relationBadgeBg: const Color(0xFFE8EDFB),
      relationBadgeText: const Color(0xFF3B5BDB), id: '',
    ),
    NomineeModel(
      name: 'Ahmed Raza',
      relation: 'Friend',
      email: 'ahmedraza@gmail.com',
      phone: '+92 321 1111111',
      avatarBg: AppColors.lightGrey,
      avatarIconColor: const Color(0xFFE05C5C),
      relationBadgeBg: const Color(0xFFE6F9EE),
      relationBadgeText: const Color(0xFF2DB87C), id: '',
    ),
    NomineeModel(
      name: 'Sara Khan',
      relation: 'Wife',
      email: 'sarakhan@gmail.com',
      phone: '+92 310 9876543',
      avatarBg: const Color(0xFFFFEDE6),
      avatarIconColor: const Color(0xFFE07840),
      relationBadgeBg: const Color(0xFFFFEDE6),
      relationBadgeText: const Color(0xFFE07840), id: '',
    ),
  ];


  List<NomineeModel> get nominees => _nominees;

  NomineeModel? _selectedNominee;
  NomineeModel? get selectedNominee => _selectedNominee;


  void addNominee(NomineeModel nominee) {
    _nominees.add(nominee);
    notifyListeners();
  }

  void removeNominee(String id) {
    _nominees.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}