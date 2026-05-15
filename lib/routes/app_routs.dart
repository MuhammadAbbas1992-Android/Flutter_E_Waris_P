import 'package:e_waris/routes/routs_name.dart';
import 'package:e_waris/views/auth/login_screen.dart';
import 'package:e_waris/views/auth/signup_screen.dart';
import 'package:e_waris/views/dashboard/home_dashboard.dart';
import 'package:e_waris/views/onboarding/onboarding_screen.dart';
import 'package:e_waris/views/splash/splash_screen.dart';

class AppRouts {
  static String initial = RoutsName.splashScreen;
  static final appRouts =
  {
    RoutsName.splashScreen : (context) => SplashScreen(),
    RoutsName.onboardingScreen : (context) => OnboardingScreen(),
    RoutsName.loginScreen : (context) => LoginScreen(),
    RoutsName.signupScreen : (context) => SignupScreen(),
    RoutsName.homeDashboard : (context) => HomeDashboard(),
  };

}