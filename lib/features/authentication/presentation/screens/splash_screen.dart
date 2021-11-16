import 'package:doanktl/features/authentication/presentation/bloc/auth2_bloc.dart';
import 'package:doanktl/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:doanktl/features/home/screens/home_screen.dart';
import 'package:doanktl/features/login/presentation/screens/login_screen.dart';
import 'package:doanktl/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const String tag = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc,AuthenticationState>(
      listener: (context,state){
       if(state is AuthenticationNotLogin){
         Navigator.pushReplacementNamed(context, LoginScreen.tag);
       }
       if(state is AuthenticationLogin){
         Navigator.pushReplacementNamed(context, HomeScreen.tag);
       }
      },
      child: const Scaffold(
        body: Center(child: Text('Splash Screen')),
      ),
    );
  }

}
