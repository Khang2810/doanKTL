import 'dart:convert';

import 'package:doanktl/features/home/model/input_vocab.dart';
import 'package:doanktl/features/home/model/vocabulary.dart';
import 'package:flutter/services.dart' as rootBundle;

class VocabRemoteServices {
  Future<List<Vocabulary>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/vocab.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((data) => Vocabulary.fromJson(data)).toList();
  }
  Future<void> uploadVocabulary(InputVocab inputVocab)async {
    print('input vocab' + inputVocab.toString());
  }
  Future<List<Vocabulary>> readJsonDataOfUser(double userId) async {
    final jsonData =
    await rootBundle.rootBundle.loadString('assets/json/vocab.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((data) => Vocabulary.fromJson(data)).toList();
  }
}
