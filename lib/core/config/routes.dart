import 'package:doanktl/features/authentication/presentation/screens/splash_screen.dart';
import 'package:doanktl/features/login/presentation/screens/login_screen.dart';
import 'package:doanktl/features/login/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    var routes = <String, WidgetBuilder>{
      SplashScreen.tag: (_) => const SplashScreen(),
      LoginScreen.tag: (_) => const LoginScreen(),
      SignUpScreen.tag: (_) => const SignUpScreen(),
    };
    return routes;
  }
}
