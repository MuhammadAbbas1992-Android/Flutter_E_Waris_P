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
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: _emailController.text.trim(),
      )
          .timeout(
        const Duration(seconds: 15),
      );

      _linkSent = true;
      return true;
    } on TimeoutException {
      _linkSent = false;
      debugPrint('Request timed out');
      return false;
    } on FirebaseAuthException catch (e) {
      _linkSent = false;
      debugPrint('Firebase Error: ${e.code}');
      return false;
    } catch (e) {
      _linkSent = false;
      debugPrint('Error: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
