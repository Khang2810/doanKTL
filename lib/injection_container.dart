import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:doanktl/core/network/network_info.dart';
import 'package:doanktl/features/login/data/datasources/user_remote_sources.dart';
import 'package:doanktl/features/login/data/repositories/user_repository_impl.dart';
import 'package:doanktl/features/login/domain/repositories/user_repository.dart';
import 'package:doanktl/features/login/domain/usecases/get_user_sign_in.dart';
import 'package:doanktl/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => LoginBloc(getUserSignIn: sl()));

  //Use case
  sl.registerLazySingleton(() => GetUserSignIn(userRepository: sl()));

  //Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: sl(),
        userRemoteSources: sl(),
      ));

  //DataSource
  sl.registerLazySingleton<UserRemoteSources>(() => UserRemoteSourcesImpl(
        client: sl(),
      ));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
