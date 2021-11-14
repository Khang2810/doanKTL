import 'dart:convert';

import 'package:doanktl/core/errors/exceptions.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteSource {
  Future<UserSigInResponseModel> getUserSignIn(
      UserSignInRequestModel userSignInRequestModel);
}

class UserRemoteSourcesImpl implements UserRemoteSource {
  final http.Client client;

  UserRemoteSourcesImpl({required this.client});

  @override
  Future<UserSigInResponseModel> getUserSignIn(
      UserSignInRequestModel userSignInRequestModel) async {
    print(userSignInRequestModel.toJson());
    final response = await client.post(
      Uri.parse('http://localhost:51269/api/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userSignInRequestModel.toJson()),
      encoding: Encoding.getByName('utf-8')
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      return UserSigInResponseModel.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }
}
