import 'package:doanktl/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:doanktl/features/authentication/presentation/screens/splash_screen.dart';
import 'package:doanktl/features/home/presentation/screens/home_screen.dart';
import 'package:doanktl/features/login/presentation/screens/login_screen.dart';
import 'package:doanktl/features/login/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    var routes = <String, WidgetBuilder>{
      SplashScreen.tag: (BuildContext context) {
        BlocProvider.of<AuthenticationBloc>(context).add(CheckLoginEvent());
        return const SplashScreen();
      },
      LoginScreen.tag: (_) => const LoginScreen(),
      SignUpScreen.tag: (_) => const SignUpScreen(),
      HomeScreen.tag: (_) => const HomeScreen(),
    };
    return routes;
  }
}
