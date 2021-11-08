import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';

class UserSignInRequestModel extends UserSignInRequest {
  final String username;
  final String password;

  const UserSignInRequestModel({
    required this.username,
    required this.password,
  }) : super(
          username: username,
          password: password,
        );

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}

class UserSigInResponseModel extends UserSigInResponse {
  final double id;
  final String userName;
  final String email;
  final List<String> roles;
  final String accessToken;

  const UserSigInResponseModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.roles,
    required this.accessToken,
  }) : super(
          id: id,
          userName: userName,
          email: email,
          roles: roles,
          accessToken: accessToken,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": userName,
      "email": email,
      "roles": roles,
      "accessToken": accessToken,
    };
  }

  factory UserSigInResponseModel.fromJson(Map<String, dynamic> json) {
    return UserSigInResponseModel(
        id: (json['id'] as num).toDouble(),
        userName: json['username'],
        email: json['email'],
        roles: List<String>.from(json['roles'] as List),
        accessToken: json['accessToken']);
  }
}
