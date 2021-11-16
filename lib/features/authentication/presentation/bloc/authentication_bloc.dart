import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/core/usecases/usecase.dart';
import 'package:doanktl/features/authentication/domain/entities/user_status.dart';
import 'package:doanktl/features/authentication/domain/usecases/check_user_login.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final CheckUserLogin checkUserLogin;

  AuthenticationBloc({required this.checkUserLogin})
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is CheckLoginEvent) {
      final failureOrStatus = await checkUserLogin(NoParams());
      yield* _eitherSignInOrNot(failureOrStatus);
    }
  }

  Stream<AuthenticationState> _eitherSignInOrNot(
      Either<Failures, UserStatus> failureOrStatus) async* {
    yield failureOrStatus.fold(
      (failure) =>  AuthenticationNotLogin(),
      (userStatus) => AuthenticationLogin(),
    );
  }
}
