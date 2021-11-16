import 'package:doanktl/features/login/presentation/bloc/login_bloc.dart';
import 'package:doanktl/features/login/presentation/screens/login_screen.dart';
import 'package:doanktl/screen/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static const String tag = 'signup_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controller = TextEditingController();
  late String userName;
  late String password;
  late String email;
  var passwordVisible = false;
  bool? agree = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.grey.shade50,
          title: Text(
            'Sign up',
            style: TextStyle(color: Colors.black, fontSize: 24),
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, height: 0.9),
                          filled: true,
                          fillColor: Colors.blueGrey.shade50),
                      onChanged: (value){
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
                      onChanged: (value){
                        email = value;
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
                      onChanged: (value){
                        password = value;
                      },
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
                          hintText: 'Confirm password',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, height: 0.9),
                          filled: true,
                          fillColor: Colors.blueGrey.shade50),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Checkbox(
                        value: agree,
                        onChanged: (value) {
                          setState(() {
                            agree = value;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                            'I would like to receive newsletters and other information.'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      height: 50,
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("By signing up, you agree to"),
                          TextButton(
                            child: Text('Term of Use'),
                            onPressed: termbutton,
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                        child: Text('Sign up'),
                        onPressed: confirmbutton,
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
                          Text("Already have account?"),
                          TextButton(
                            child: Text('Log in'),
                            onPressed: loginbutton,
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
                    Navigator.popAndPushNamed(context, LoginScreen.tag);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void appbarback() {}

  void loginbutton() {}

  void confirmbutton() {
    controller.clear();
    BlocProvider.of<LoginBloc>(context).add(GetUserSignUpEvent(
      userName: userName,
      password: password,
      email: email,
    ));
  }

  void termbutton() {}
}
