import 'package:flutter/material.dart';

class FindVocabScreen extends StatefulWidget {
  static const String tag = 'find_screen';

  const FindVocabScreen({Key? key}) : super(key: key);

  @override
  State<FindVocabScreen> createState() => _FindVocabScreenState();
}

class _FindVocabScreenState extends State<FindVocabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Vocab"),
      ),
      body: Center(
        child: Text("find"),
      ),
    );
  }
}
