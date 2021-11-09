import "package:equatable/equatable.dart";

class UserSignInRequest extends Equatable {
  final String username;
  final String password;

  const UserSignInRequest({
    required this.username,
    required this.password,
  }) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}

class UserSigInResponse extends Equatable {
  final double id;
  final String userName;
  final String email;
  final List<String> roles;
  final String accessToken;

  const UserSigInResponse({
    required this.id,
    required this.userName,
    required this.email,
    required this.roles,
    required this.accessToken,
  });

  @override
  String toString() {
    return 'UserSigInResponse{id: $id, userName: $userName, email: $email, roles: $roles, accessToken: $accessToken}';
  }

  @override
  List<Object> get props => [id,userName,email,roles,accessToken];
}
