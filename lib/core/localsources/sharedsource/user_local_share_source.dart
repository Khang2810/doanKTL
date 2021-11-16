import 'dart:convert';

import 'package:doanktl/core/constants/share_constant.dart';
import 'package:doanktl/core/errors/exceptions.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalShareSource {
  Future<UserSigInResponseModel> getLastUserSignInResponse();

  Future<void> cacheUserSignInResponse(UserSigInResponseModel userModel);
}

class UserLocalShareSourceImpl extends UserLocalShareSource {
  final SharedPreferences sharedPreferences;

  UserLocalShareSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cacheUserSignInResponse(UserSigInResponseModel userModel) {
    return sharedPreferences.setString(
        ShareConstant.cachedUser, json.encode(userModel.toJson()));
  }

  @override
  Future<UserSigInResponseModel> getLastUserSignInResponse() {
    final jsonString = sharedPreferences.getString(ShareConstant.cachedUser);
    if (jsonString != null) {
      return Future.value(
          UserSigInResponseModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
