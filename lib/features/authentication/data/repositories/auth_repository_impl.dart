import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/exceptions.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/features/authentication/domain/entities/user_status.dart';
import 'package:doanktl/features/authentication/domain/repositories/auth_repository.dart';
import 'package:doanktl/core/localsources/sharedsource/user_local_share_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalShareSource userLocalShareSource;

  AuthRepositoryImpl({required this.userLocalShareSource});

  @override
  Future<Either<Failures, UserStatus>> getUserStatus() async {
    try {
      await userLocalShareSource.getLastUserSignInResponse();
      return const Right(UserStatus.userLoggedIn);
    } on CacheException {
      return Left(CacheFailures());
    }
  }
}
