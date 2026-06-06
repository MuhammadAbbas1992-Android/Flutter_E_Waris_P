import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class EmergencyMessageProvider extends ChangeNotifier{}
class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  bool get isLoading => _isLoading;}