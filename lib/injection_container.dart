import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:doanktl/core/localsources/sharedsource/user_local_share_source.dart';
import 'package:doanktl/core/network/network_info.dart';
import 'package:doanktl/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:doanktl/features/authentication/domain/repositories/auth_repository.dart';
import 'package:doanktl/features/authentication/domain/usecases/check_user_login.dart';
import 'package:doanktl/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:doanktl/features/login/data/datasources/user_remote_source.dart';
import 'package:doanktl/features/login/data/repositories/user_repository_impl.dart';
import 'package:doanktl/features/login/domain/repositories/user_repository.dart';
import 'package:doanktl/features/login/domain/usecases/get_user_sign_in.dart';
import 'package:doanktl/features/login/domain/usecases/get_user_sign_up.dart';
import 'package:doanktl/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => LoginBloc(getUserSignIn: sl(),getUserSignUp: sl()));
  sl.registerFactory(() => AuthenticationBloc(checkUserLogin: sl()));

  //Use case
  sl.registerLazySingleton(() => GetUserSignIn(userRepository: sl()));
  sl.registerLazySingleton(() => CheckUserLogin(authRepository: sl()));
  sl.registerLazySingleton(() => GetUserSignUp(userRepository: sl()));

  //Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: sl(),
        userRemoteSources: sl(),
        userLocalShareSource: sl(),
      ));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(userLocalShareSource: sl()));
  //DataSource
  sl.registerLazySingleton<UserRemoteSource>(() => UserRemoteSourcesImpl(
        client: sl(),
      ));
  sl.registerLazySingleton<UserLocalShareSource>(
      () => UserLocalShareSourceImpl(sharedPreferences: sl()));
  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
