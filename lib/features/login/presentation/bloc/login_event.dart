part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetUserLoginEvent extends LoginEvent {
  final String userName;
  final String password;

  GetUserLoginEvent({required this.userName, required this.password});
}

class GetUserSignUpEvent extends LoginEvent {
  final String userName;
  final String password;
  final String email;

  GetUserSignUpEvent({
    required this.userName,
    required this.password,
    required this.email,
  });
}
