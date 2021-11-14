import 'package:dartz/dartz.dart';
import 'package:doanktl/features/login/data/models/user_sign_in_model.dart';
import 'package:doanktl/features/login/domain/entities/user_sign_in.dart';
import 'package:doanktl/features/login/domain/usecases/get_user_sign_in.dart';

class Login2Bloc {
  final GetUserSignIn getUserSignIn;
  var name = '';

  Login2Bloc({
    required this.getUserSignIn,
  });

  void testUser() async {
    UserSignInRequest userSignInRequest =
        const UserSignInRequestModel(username: 'tony', password: '12356789');
    final response = await getUserSignIn(userSignInRequest);
    print('user is right ${response.isRight()}');

    response.fold(
      (l) => 'error',
      (r) {
        name = r.userName;
        print('user name ${r.toString()}');
        return r;
      },
    );
    print('user name ${name}');
  }
}
