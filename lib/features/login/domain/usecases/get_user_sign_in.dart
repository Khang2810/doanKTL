import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/core/usecases/usecase.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:doanktl/features/login/domain/repositories/user_repository.dart';

class GetUserSignIn implements UseCase<UserSigInResponse,UserSignInRequestModel> {
  final UserRepository userRepository;

  GetUserSignIn({
    required this.userRepository,
  });

  @override
  Future<Either<Failures, UserSigInResponse>> call(UserSignInRequestModel params) async {
    return await userRepository.getUserSignIn(params);
  }

}
