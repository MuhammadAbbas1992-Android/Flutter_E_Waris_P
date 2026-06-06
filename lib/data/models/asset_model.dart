import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AssetModel {
  final String name;
  final String category;
  final String assignedTo;
  final Color assignedColor;
  final Widget icon;

  const AssetModel({
    required this.name,
    required this.category,
    required this.assignedTo,
    required this.assignedColor,
    required this.icon,
  });
}