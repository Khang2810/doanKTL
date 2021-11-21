import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Notification'), actions: [
          IconButton(
              onPressed: searchbutton,
              icon: Icon(
                Icons.search,
                size: 36,
              ))
        ]),
        body: const Center(
          child: Text('page 3'),
        ),
      ),
    );
  }

  void searchbutton() {}
}
