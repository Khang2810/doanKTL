import 'dart:js';

import 'package:flutter/material.dart';

class AddVocabScreen extends StatefulWidget {
  static const String tag = 'add_vocab_screen';

  const AddVocabScreen({Key? key}) : super(key: key);

  @override
  _AddVocabScreenState createState() => _AddVocabScreenState();
}

class _AddVocabScreenState extends State<AddVocabScreen> {
  late String vocabName;
  late String vocabVietnameseName;
  late String vocabMeaning;
  late String vocabImageUrl;
  late List<String> categories;
  late List<String> example;
  final TextEditingController _textFieldController = TextEditingController();
  List<Widget> listCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Vocabulary'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Vietnamese meaning',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'English meaning',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Example photo URL'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _displayTextInputDialog(context);
                },
                child: Text('Add Category')),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: listCategory,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Category name'),
          content: TextField(
            autofocus: true,
            controller: _textFieldController,
            decoration:
                InputDecoration(hintText: "Exp: Sport, School, Family, ..."),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('ADD'),
              onPressed: () {
                setState(() {
                  listCategory.add(ElevatedButton(
                      onPressed: removebutton,
                      child: Text(_textFieldController.text)));
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void removebutton() {}
}
