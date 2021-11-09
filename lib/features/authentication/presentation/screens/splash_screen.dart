import 'package:doanktl/features/login/presentation/screens/login_screen.dart';
import 'package:doanktl/screen/log_in.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String tag = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }
  _navigateToHome()async{
    await Future.delayed(const Duration(milliseconds: 1500),(){});
    Navigator.pushReplacementNamed(context, LoginScreen.tag);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }

}
