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
}
