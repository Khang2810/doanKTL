import 'package:doanktl/features/home/screens/find_vocab_screen.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Exercise'), actions: [
          IconButton(
              onPressed: () => searchbutton(context),
              icon: Icon(
                Icons.search,
                size: 36,
              ))
        ]),
        body: const Center(
          child: Text('page 2'),
        ),
      ),
    );
  }

  void searchbutton(BuildContext context) {
    Navigator.pushNamed(context, FindVocabScreen.tag);
  }
}
