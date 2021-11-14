import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final List properties;

  const Failures([this.properties = const <dynamic>[]]) : super();

  @override
  List<Object?> get props => properties;
}

//gereral failure
class ServerFailures extends Failures {}

class CacheFailures extends Failures {}

class NetworkFailures extends Failures{}