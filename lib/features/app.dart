import 'package:doanktl/core/config/routes.dart';
import 'package:doanktl/core/constants/strings.dart';
import 'package:doanktl/features/authentication/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      initialRoute: SplashScreen.tag,
      routes: AppRoutes.getRoutes(),
    );
  }
}
