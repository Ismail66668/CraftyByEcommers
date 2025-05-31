import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/features/auth/email_verification.dart';
import 'package:ostad_ecommers_app/features/auth/loging_screen.dart';
import 'package:ostad_ecommers_app/features/auth/otp_verification.dart';
import 'package:ostad_ecommers_app/features/auth/set_password.dart';
import 'package:ostad_ecommers_app/features/auth/singup_screen.dart';
import 'package:ostad_ecommers_app/features/ui/screen/home_screen/ui/screen/home_screen.dart';

import '../features/auth/splash_screen.dart';

class AppRoutes {
  Route<dynamic> route(RouteSettings settings) {
    late final Widget screenWidget;

    if (settings.name == SplashScreen.name) {
      screenWidget = const SplashScreen();
    } else if (settings.name == LogingScreen.name) {
      screenWidget = const LogingScreen();
    } else if (settings.name == SingupScreen.name) {
      screenWidget = const SingupScreen();
    } else if (settings.name == EmailVerification.name) {
      screenWidget = const EmailVerification();
    } else if (settings.name == OtpVerification.name) {
      screenWidget = OtpVerification();
    } else if (settings.name == SetPassword.name) {
      screenWidget = const SetPassword();
    } else if (settings.name == HomeScreen.name) {
      screenWidget = const HomeScreen();
    } else {}

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
