import 'package:doanktl/features/login/domain/entities/user_sign_up.dart';

class UserSignUpRequestModel extends UserSignUpRequest {
  const UserSignUpRequestModel(
    final String userName,
    final String email,
    final String password,
  ) : super(
          userName: userName,
          email: email,
          password: password,
        );

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "email": email,
      "password": password,
      "role": UserSignUpRequest.roles,
    };
  }
}

class UserSignUpResponseModel extends UserSignUpResponse {
  const UserSignUpResponseModel(final String message) : super(message: message);

  factory UserSignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return UserSignUpResponseModel(json['message']);
  }
}
