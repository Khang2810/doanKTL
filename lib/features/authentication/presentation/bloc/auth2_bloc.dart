import 'package:doanktl/core/usecases/usecase.dart';
import 'package:doanktl/features/authentication/domain/usecases/check_user_login.dart';

class Auth2Bloc {
  final CheckUserLogin checkUserLogin;

  Auth2Bloc({
    required this.checkUserLogin,
  });

  Future<void> testUserStatus() async {
    final userStatus = await checkUserLogin(NoParams());
    userStatus.fold((l) => 'error', (r) {
      print('user login $r');
      return r;
    });
  }
}
