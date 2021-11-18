import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doanktl/features/home/model/vocabulary.dart';
import 'package:doanktl/features/home/repositories/vocab_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final VocabRepository vocabRepository;

  HomeBloc({required this.vocabRepository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeDashboardInit) {
      final data = await vocabRepository.getVocabularies();
      yield (HomeLoaded(vocabularies: data));
    }
  }
}
