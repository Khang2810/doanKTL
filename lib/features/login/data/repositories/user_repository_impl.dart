import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/exceptions.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/core/network/network_info.dart';
import 'package:doanktl/features/login/data/datasources/user_remote_sources.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_up.dart';
import 'package:doanktl/features/login/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteSources userRemoteSources;

  UserRepositoryImpl({
    required this.networkInfo,
    required this.userRemoteSources,
  });

  @override
  Future<Either<Failures, UserSigInResponse>> getUserSignIn(
      UserSignInRequestModel userSignInRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await userRemoteSources.getUserSignIn(
            userSignInRequest);
        return Right(remoteUser);
      } on ServerException{
        return Left(ServerFailures());
      }
    }else{
      return Left(CacheFailures());
    }
  }

  @override
  Future<Either<Failures, UserSignUpResponse>> getUserSignUp(
      UserSignUpRequest userSignUpRequest) {
    // TODO: implement getUserSignUp
    throw UnimplementedError();
  }
}
