import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;
  bool _isLoading = false;
  bool _linkSent = false;

  bool get isLoading => _isLoading;

  bool get linkSent => _linkSent;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void clearEmail() {
    _emailController.clear();
    print('ABC clear Email');
    notifyListeners();
  }

  Future<bool> sendEmailLink() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      print('ABC send email');
      _linkSent = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
