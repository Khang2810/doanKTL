part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeDashboardInit extends HomeEvent {}

class AddVocabEvent extends HomeEvent {
  final InputVocab inputVocab;

  AddVocabEvent(this.inputVocab);
}

class HomeProfileInit extends HomeEvent {
  final UserSigInResponse userSigInResponse;

  HomeProfileInit(this.userSigInResponse);
}
