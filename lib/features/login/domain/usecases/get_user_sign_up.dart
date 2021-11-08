import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/core/usecases/usecase.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_up.dart';
import 'package:doanktl/features/login/domain/repositories/user_repository.dart';

class GetUserSignUp implements UseCase<UserSignUpResponse, UserSignUpRequest> {
  final UserRepository userRepository;

  GetUserSignUp({
    required this.userRepository,
  });

  @override
  Future<Either<Failures, UserSignUpResponse>> call(
      UserSignUpRequest params) async {
    return await userRepository.getUserSignUp(params);
  }
}
