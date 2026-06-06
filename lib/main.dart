import 'package:e_waris/view_models/asset_provider.dart';
import 'package:e_waris/view_models/auth/auth_provider.dart';
import 'package:e_waris/view_models/dashboard_provider.dart';
import 'package:e_waris/view_models/emergency_provider.dart';
import 'package:e_waris/view_models/nominee_provider.dart';
import 'package:e_waris/view_models/notifications_provider.dart';
import 'package:e_waris/view_models/onboarding_provider.dart';
import 'package:e_waris/routes/app_routs.dart';
import 'package:e_waris/views/alive_check_popup.dart';
import 'package:e_waris/views/auth/login_screen.dart';
import 'package:e_waris/views/auth/signup_screen.dart';
import 'package:e_waris/views/dashboard_screen.dart';
import 'package:e_waris/views/nominee_note_screen.dart';
import 'package:e_waris/views/onboarding_screen.dart';
import 'package:e_waris/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => AssetProvider()),
        ChangeNotifierProvider(create: (_) => NomineeProvider()),
        ChangeNotifierProvider(create: (_) => NotificationsProvider()),
        ChangeNotifierProvider(create: (_) => EmergencyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        // home: const SplashScreen(),
        // home: const OnboardingScreen(),
        home: const DashboardScreen(),
        // home: const LoginScreen(),
        // home: const SignupScreen(),
        // home: const AliveCheckPopup(),
        // initialRoute: AppRouts.initial,
        // routes: AppRouts.appRouts,
      ),
    );
  }
}
