import 'package:e_waris/routes/routs_name.dart';
import 'package:e_waris/views/assets/add_edit_asset_screen.dart';
import 'package:e_waris/views/assets/assets_screen.dart';
import 'package:e_waris/views/auth/change_password_screen.dart';
import 'package:e_waris/views/auth/forgot_password_screen.dart';
import 'package:e_waris/views/auth/login_screen.dart';
import 'package:e_waris/views/auth/signup_screen.dart';
import 'package:e_waris/views/dashboard_screen.dart';
import 'package:e_waris/views/home_screen.dart';
import 'package:e_waris/views/nominees/add_edit_nominee_screen.dart';
import 'package:e_waris/views/nominees/nominee_screen.dart';
import 'package:e_waris/views/onboarding_screen.dart';
import 'package:e_waris/views/profile_screen.dart';
import 'package:e_waris/views/settings/notify_screen.dart';
import 'package:e_waris/views/settings/settings_screen.dart';
import 'package:e_waris/views/splash_screen.dart';

class AppRouts {
  static String initial = RoutsName.splashScreen;
  static final appRouts =
  {
    RoutsName.splashScreen : (context) => SplashScreen(),
    RoutsName.onboardingScreen : (context) => OnboardingScreen(),
    RoutsName.loginScreen : (context) => LoginScreen(),
    RoutsName.forgotPasswordScreen : (context) => ForgotPasswordScreen(),
    RoutsName.signupScreen : (context) => SignupScreen(),
    RoutsName.homeScreen : (context) => HomeScreen(),
    RoutsName.dashboardScreen : (context) => DashboardScreen(),
    RoutsName.assetsScreen : (context) => AssetsScreen(),
    RoutsName.addEditAssetScreen :(context) => AddEditAssetScreen(),
    RoutsName.nomineeScreen : (context) => NomineesScreen(),
    RoutsName.addEditNomineeScreen :(context) => AddEditNomineeScreen(),
    RoutsName.settingsScreen : (context) => SettingsScreen(),
    RoutsName.profileScreen : (context) => ProfileScreen(),
    RoutsName.changePasswordScreen : (context) => ChangePasswordScreen(),
    RoutsName.notifyScreen : (context) => NotifyScreen(),};
  

}