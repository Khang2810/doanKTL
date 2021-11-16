import 'package:doanktl/features/home/screens/home_screen.dart';
import 'package:doanktl/features/login/presentation/bloc/login_bloc.dart';
import 'package:doanktl/features/login/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const String tag = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();
  late String userName;
  late String password;
  var passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          title: Text(
            'Log in',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: appbarback,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, height: 0.9),
                          filled: true,
                          fillColor: Colors.blueGrey.shade50),
                      onChanged: (value) {
                        userName = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: controller,
                      obscureText: !passwordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: passwordVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, height: 0.9),
                          filled: true,
                          fillColor: Colors.blueGrey.shade50),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                        child: Text('Log in'),
                        onPressed: loginbutton,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      height: 50,
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have account?"),
                          TextButton(
                            child: Text('Sign up'),
                            onPressed: signupbutton,
                          ),
                        ],
                      )),
                ),
                BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is LoginError) {
                    return const Text('login error');
                  }
                  return Container();
                }, listener: (context, state) {
                  if (state is LoginLoaded) {
                    Navigator.popAndPushNamed(context, HomeScreen.tag);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void appbarback() {}

  void loginbutton() {
    controller.clear();
    BlocProvider.of<LoginBloc>(context).add(GetUserLoginEvent(
      userName: userName,
      password: password,
    ));
  }

  void signupbutton() {
    Navigator.pushNamed(context, SignUpScreen.tag);
  }
}
