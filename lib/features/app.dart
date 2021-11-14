import 'package:doanktl/core/config/routes.dart';
import 'package:doanktl/core/constants/strings.dart';
import 'package:doanktl/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:doanktl/features/authentication/presentation/screens/splash_screen.dart';
import 'package:doanktl/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => sl<AuthenticationBloc>(),
        ),
      ],
      child: MaterialApp(
        title: Strings.appName,
        initialRoute: SplashScreen.tag,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
