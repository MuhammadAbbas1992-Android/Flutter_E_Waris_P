import 'package:flutter/material.dart';

class NomineeModel {
  final String? id;
  final String name;
  final String relation;
  final String email;
  final String phone;
  final Color avatarBg;
  final Color avatarIconColor;
  final Color relationBadgeBg;
  final Color relationBadgeText;

  NomineeModel({
    this.id,
    required this.name,
    required this.relation,
    required this.email,
    required this.phone,
    required this.avatarBg,
    required this.avatarIconColor,
    required this.relationBadgeBg,
    required this.relationBadgeText,
  });

  // copyWith
  NomineeModel copyWith({
    String? id,
    String? name,
    String? relation,
    String? email,
    String? phone,
    Color? avatarBg,
    Color? avatarIconColor,
    Color? relationBadgeBg,
    Color? relationBadgeText,
  }) {
    return NomineeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      relation: relation ?? this.relation,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarBg: avatarBg ?? this.avatarBg,
      avatarIconColor: avatarIconColor ?? this.avatarIconColor,
      relationBadgeBg: relationBadgeBg ?? this.relationBadgeBg,
      relationBadgeText: relationBadgeText ?? this.relationBadgeText,
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'relation': relation,
      'email': email,
      'phone': phone,
      'avatarBg': avatarBg.value,
      'avatarIconColor': avatarIconColor.value,
      'relationBadgeBg': relationBadgeBg.value,
      'relationBadgeText': relationBadgeText.value,
    };
  }

  // fromMap
  factory NomineeModel.fromMap(Map<String, dynamic> map) {
    return NomineeModel(
      id: map['id'], // can be null
      name: map['name'] ?? '',
      relation: map['relation'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      avatarBg: Color(map['avatarBg'] ?? 0xFF000000),
      avatarIconColor: Color(map['avatarIconColor'] ?? 0xFFFFFFFF),
      relationBadgeBg: Color(map['relationBadgeBg'] ?? 0xFF000000),
      relationBadgeText: Color(map['relationBadgeText'] ?? 0xFFFFFFFF),
    );
  }

  // JSON helpers
  factory NomineeModel.fromJson(Map<String, dynamic> json) =>
      NomineeModel.fromMap(json);

  Map<String, dynamic> toJson() => toMap();
}