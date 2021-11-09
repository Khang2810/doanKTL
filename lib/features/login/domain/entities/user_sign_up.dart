import 'package:equatable/equatable.dart';

class UserSignUpRequest extends Equatable {
  final String userName;
  final String email;
  final String password;
  static const List<String> roles = ['user'];

  const UserSignUpRequest({
    required this.userName,
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [userName, email, password];
}

class UserSignUpResponse extends Equatable {
  final String message;

  const UserSignUpResponse({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
