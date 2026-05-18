import 'package:e_waris/routes/routs_name.dart';
import 'package:e_waris/views/assets/assets_screen.dart';
import 'package:e_waris/views/auth/login_screen.dart';
import 'package:e_waris/views/auth/signup_screen.dart';
import 'package:e_waris/views/dashboard_screen.dart';
import 'package:e_waris/views/nominees/nominee_screen.dart';
import 'package:e_waris/views/notifications_screen.dart';
import 'package:e_waris/views/onboarding_screen.dart';
import 'package:e_waris/views/settings/setting_screen.dart';
import 'package:e_waris/views/splash_screen.dart';

class AppRouts {
  static String initial = RoutsName.splashScreen;
  static final appRouts =
  {
    RoutsName.splashScreen : (context) => SplashScreen(),
    RoutsName.onboardingScreen : (context) => OnboardingScreen(),
    RoutsName.loginScreen : (context) => LoginScreen(),
    RoutsName.signupScreen : (context) => SignupScreen(),
    RoutsName.dashboardScreen : (context) => DashboardScreen(),
    RoutsName.assetsScreen : (context) => AssetsScreen(),
    RoutsName.nomineeScreen : (context) => NomineeScreen(),
    RoutsName.notificationsScreen : (context) => NotificationsScreen(),
    RoutsName.settingScreen : (context) => SettingScreen(),  };

}