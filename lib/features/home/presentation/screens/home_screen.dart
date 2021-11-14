import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doanktl/core/localsources/sharedsource/user_local_share_source.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection_container.dart';

class HomeScreen extends StatefulWidget {
  static const String tag = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _imagePaths = [
    'https://cdn.wallpapersafari.com/72/40/9lov8z.jpg',
    'https://i.pinimg.com/originals/97/52/34/975234355136bda9a2f1fd7dcdec09e0.jpg',
    'http://www.imagesavant.com/images-720/halo2-720.0001.jpg',
    'https://cdn.wallpapersafari.com/95/5/3rRDsg.jpg',
    'https://www.teahub.io/photos/full/45-456248_sad-anime-wallpaper-aesthetic.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.grey.shade50,
                leadingWidth: 110,
                leading: TextButton(
                  child: Text('Recently',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      )),
                  onPressed: recentlybutton,
                ),
                title: TextButton(
                  child: Text(
                    'Hot',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  onPressed: hotbutton,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: hotbutton,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: hotbutton,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.book_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: hotbutton,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.question_answer_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: hotbutton,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: hotbutton,
                    ),
                  ],
                ),
              ),
              body: Center(
                child: CarouselSlider(
                  items: _imagePaths.map((e) {
                    return Builder(
                        builder: (context) => Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              children: [
                                Image.network(
                                  e,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: vocabbutton,
                                        child: Text(
                                          'inform',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          '/ɪn.ˈfɔrm/',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 5, right: 5),
                                  child: Text(
                                    'to give (someone) facts or information; tell',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            )));
                  }).toList(),
                  options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      aspectRatio: 0.6,
                      enlargeCenterPage: true),
                ),
              )),
        ));
  }

  void recentlybutton() async {
     await UserLocalShareSourceImpl(sharedPreferences: sl<SharedPreferences>()).sharedPreferences.remove('CACHED_USER_LOGIN');
     print('logout success');
  }

  void hotbutton() {}

  void vocabbutton() {}
}
