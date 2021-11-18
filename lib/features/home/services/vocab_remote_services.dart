import 'dart:convert';

import 'package:doanktl/features/home/model/vocabulary.dart';
import 'package:flutter/services.dart' as rootBundle;

class VocabRemoteServices {
  Future<List<Vocabulary>> readJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/user_vocab.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((data) => Vocabulary.fromJson(data)).toList();
  }
}
