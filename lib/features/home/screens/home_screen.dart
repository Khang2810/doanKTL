import 'package:doanktl/core/localsources/sharedsource/user_local_share_source.dart';
import 'package:doanktl/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:doanktl/features/home/bloc/home_bloc.dart';
import 'package:doanktl/features/home/pages/dashboard_page.dart';
import 'package:doanktl/features/home/pages/exercise_page.dart';
import 'package:doanktl/features/home/pages/notification_page.dart';
import 'package:doanktl/features/home/pages/profile_page.dart';
import 'package:doanktl/features/home/screens/add_vocab_screen.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

class HomeScreen extends StatefulWidget {
  static const String tag = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> pages = [
    DashboardPage(),
    ExercisePage(),
    NotificationPage(),
    ProfilePage(),
  ];
  late UserSigInResponse userSigInResponse;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = DashboardPage();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeDashboardInit());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLogin) {
          userSigInResponse = state.userSigInResponse;
        }
      },
      child: Scaffold(
        body: PageStorage(
          child: currentPage,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, AddVocabScreen.tag);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        width: 70,
                        height: 60,
                        child: MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentPage = DashboardPage();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.dashboard,
                                color:
                                    currentTab == 0 ? Colors.blue : Colors.grey,
                              ),
                              const Text("Home",
                                  style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 70,
                        child: MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentPage = ExercisePage();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book,
                                color:
                                    currentTab == 1 ? Colors.blue : Colors.grey,
                              ),
                              const Text("Exercise",
                                  style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      SizedBox(
                        height: 60,
                        width: 70,
                        child: MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentPage = NotificationPage();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                color:
                                    currentTab == 2 ? Colors.blue : Colors.grey,
                              ),
                              const Text(
                                "News",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 70,
                        child: MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentPage = ProfilePage();
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color:
                                    currentTab == 3 ? Colors.blue : Colors.grey,
                              ),
                              const Text("Profile",
                                  style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  void recentlybutton() async {
    await UserLocalShareSourceImpl(sharedPreferences: sl<SharedPreferences>())
        .sharedPreferences
        .remove('CACHED_USER_LOGIN');
    print('logout success');
  }

  void hotbutton() {}

  void vocabbutton() {}
}
