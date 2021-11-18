import 'package:doanktl/features/home/model/input_vocab.dart';
import 'package:doanktl/features/home/model/vocabulary.dart';
import 'package:doanktl/features/home/repositories/vocab_repository.dart';
import 'package:doanktl/features/home/services/vocab_remote_services.dart';

class VocabRepositoryImpl extends VocabRepository {
  VocabRemoteServices vocabRemoteServices;

  VocabRepositoryImpl({required this.vocabRemoteServices});

  @override
  Future<List<Vocabulary>> getVocabularies() async {
    final data = await vocabRemoteServices.readJsonData();
    return data;
  }

  @override
  Future<void> uploadVocabulary(InputVocab inputVocab) async {
    vocabRemoteServices.uploadVocabulary(inputVocab);
  }

  @override
  Future<List<Vocabulary>> getUserVocabularies(double userId) async {
    final data = await vocabRemoteServices.readJsonDataOfUser(userId);
    return data;
  }


}
