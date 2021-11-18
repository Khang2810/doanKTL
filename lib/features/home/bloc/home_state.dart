part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState{
  final List<Vocabulary> vocabularies;

  HomeLoaded({required this.vocabularies});
}
