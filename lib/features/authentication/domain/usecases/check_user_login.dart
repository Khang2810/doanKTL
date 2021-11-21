import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/core/usecases/usecase.dart';
import 'package:doanktl/features/authentication/domain/repositories/auth_repository.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';

class CheckUserLogin implements UseCase<UserSigInResponse, NoParams> {
  final AuthRepository authRepository;

  CheckUserLogin({
    required this.authRepository,
  });

  @override
  Future<Either<Failures, UserSigInResponse>> call(NoParams params) async {
    return await authRepository.getUserStatus();
  }
}
