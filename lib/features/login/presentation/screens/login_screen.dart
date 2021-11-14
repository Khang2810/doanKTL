import 'package:doanktl/features/login/presentation/bloc/login2_bloc.dart';
import 'package:doanktl/features/login/presentation/screens/signup_screen.dart';
import 'package:doanktl/injection_container.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String tag = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void appbarback() {}

  void loginbutton() {
    sl<Login2Bloc>().testUser();
  }

  void signupbutton() {
    Navigator.pushNamed(context, SignUpScreen.tag);
  }
}
