import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';

abstract class AuthRepository {
  Future<Either<Failures, UserSigInResponse>> getUserStatus();
}
