import 'package:doanktl/features/home/model/input_vocab.dart';
import 'package:doanktl/features/home/model/vocabulary.dart';

abstract class VocabRepository{
  Future<List<Vocabulary>> getVocabularies();
  Future<void> uploadVocabulary(InputVocab inputVocab);
  Future<List<Vocabulary>> getUserVocabularies(double userId);
}