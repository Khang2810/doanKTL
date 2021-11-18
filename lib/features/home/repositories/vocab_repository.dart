import 'package:doanktl/features/home/model/vocabulary.dart';

abstract class VocabRepository{
  Future<List<Vocabulary>> getVocabularies();
}