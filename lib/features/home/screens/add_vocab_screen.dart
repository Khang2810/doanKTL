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
            TextField(
              decoration: InputDecoration(labelText: 'vocabulary name'),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'vocabVietnameseName',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'vocabMeaning',
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'vocabImageUrl'),
            ),
            Text('category'),
            ElevatedButton(
                onPressed: () {
                  _displayTextInputDialog(context);
                },
                child: Text('add category')),
            Row(
              children: listCategory,
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
          title: Text('TextField in Dialog'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Text Field in Dialog"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  listCategory.add(
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(_textFieldController.text),
                    ),
                  );
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
