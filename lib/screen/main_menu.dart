import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainMenuState();
  }
}

class _MainMenuState extends State<MainMenu> {
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
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: addnew,
                backgroundColor: Colors.black,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 10,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                          ],
                        ),
                      ),
                      Row(
                        children: [
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
                    ],
                  ),
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

  void recentlybutton() {}
  void hotbutton() {}
  void vocabbutton() {}
  void addnew() {}
}
