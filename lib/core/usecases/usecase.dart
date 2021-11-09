import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, ParamType> {
  Future<Either<Failures, Type>> call(ParamType params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}