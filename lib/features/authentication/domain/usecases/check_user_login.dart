import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/core/usecases/usecase.dart';
import 'package:doanktl/features/authentication/domain/entities/user_status.dart';
import 'package:doanktl/features/authentication/domain/repositories/auth_repository.dart';

class CheckUserLogin implements UseCase<UserStatus, NoParams> {
  final AuthRepository authRepository;

  CheckUserLogin({
    required this.authRepository,
  });

  @override
  Future<Either<Failures, UserStatus>> call(NoParams params) async {
    return await authRepository.getUserStatus();
  }
}
