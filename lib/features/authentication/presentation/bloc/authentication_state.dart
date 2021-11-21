part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationNotLogin extends AuthenticationState{}

class AuthenticationLogin extends AuthenticationState{
  final UserSigInResponse userSigInResponse;

  AuthenticationLogin(this.userSigInResponse);
}