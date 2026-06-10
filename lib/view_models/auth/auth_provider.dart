import 'dart:async';

import 'package:e_waris/routes/routs_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/app_utils.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Toggle password visibility
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      UserCredential response = await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .timeout(const Duration(seconds: 10));

      final user = response.user;

      if (user != null) {
        // 🔥 Save userId in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user.uid);
        AppUtils.userId=user.uid;
        return true;
      }

      return false;
    } on FirebaseAuthException {
      return false;
    } on TimeoutException {
      return false;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      UserCredential response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).timeout(const Duration(seconds: 10));
      return response.user != null;
    }on FirebaseAuthException {
      return false;
    } on TimeoutException {
      return false;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}
