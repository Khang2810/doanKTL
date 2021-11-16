import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:doanktl/core/errors/failures.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';
import 'package:doanktl/features/login/data/models/user_sign_up_model.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_up.dart';
import 'package:doanktl/features/login/domain/usecases/get_user_sign_in.dart';
import 'package:doanktl/features/login/domain/usecases/get_user_sign_up.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetUserSignIn getUserSignIn;
  final GetUserSignUp getUserSignUp;

  LoginBloc({
    required this.getUserSignUp,
    required this.getUserSignIn,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is GetUserLoginEvent) {
      yield LoginLoading();
      final failureOrUserSignIn = await getUserSignIn(UserSignInRequestModel(
        username: event.userName,
        password: event.password,
      ));
      yield* _eitherLoadedOrErrorStateSigIn(failureOrUserSignIn);
    }
    if (event is GetUserSignUpEvent) {
      yield LoginLoading();
      final failureOrUserSignUp = await getUserSignUp(
        UserSignUpRequestModel(
          event.userName,
          event.email,
          event.password,
        ),
      );
      yield* _eitherLoadedOrErrorStateSigUp(failureOrUserSignUp);
    }
  }

  Stream<LoginState> _eitherLoadedOrErrorStateSigIn(
    Either<Failures, UserSigInResponse> failureOrUserLogin,
  ) async* {
    yield failureOrUserLogin.fold(
      (failure) => LoginError(),
      (response) => LoginLoaded(),
    );
  }
  Stream<LoginState> _eitherLoadedOrErrorStateSigUp(
      Either<Failures, UserSignUpResponse> failureOrUserSignUp,
      ) async* {
    yield failureOrUserSignUp.fold(
          (failure) => LoginError(),
          (response) => LoginLoaded(),
    );
  }
}
