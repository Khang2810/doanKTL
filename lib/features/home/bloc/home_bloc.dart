import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doanktl/features/home/model/input_vocab.dart';
import 'package:doanktl/features/home/model/vocabulary.dart';
import 'package:doanktl/features/home/repositories/vocab_repository.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final VocabRepository vocabRepository;
  List<Vocabulary> vocabList = [];
  HomeBloc({required this.vocabRepository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeDashboardInit) {
      final data = await vocabRepository.getVocabularies();
      yield (HomeLoaded(vocabularies: data));
    }
    if(event is AddVocabEvent){
      vocabRepository.uploadVocabulary(event.inputVocab);

    }
    if(event is HomeProfileInit){
      print(event.userSigInResponse.id);
      final data = await vocabRepository.getUserVocabularies(event.userSigInResponse.id);
      yield ProfileLoaded(vocabularies: data);
    }
  }
}
