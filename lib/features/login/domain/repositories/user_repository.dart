import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_up.dart';

abstract class UserRepository {
  Future<Either<Failures, UserSigInResponse>> getUserSignIn(
      UserSignInRequest userSignInRequest);

  Future<Either<Failures, UserSignUpResponse>> getUserSignUp(
      UserSignUpRequest userSignUpRequest);
}
