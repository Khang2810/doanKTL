import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/exceptions.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/core/localsources/sharedsource/user_local_share_source.dart';
import 'package:doanktl/features/authentication/domain/repositories/auth_repository.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalShareSource userLocalShareSource;

  AuthRepositoryImpl({required this.userLocalShareSource});

  @override
  Future<Either<Failures, UserSigInResponseModel>> getUserStatus() async {
    try {
      final data = await userLocalShareSource.getLastUserSignInResponse();
      return Right(data);
    } on CacheException {
      return Left(CacheFailures());
    }
  }
}
