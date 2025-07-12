import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/interceptors.dart';
import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/features/user_auth/signup_user/data/repositories/signup_user_repository_impli.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/repositories/signup_user_repositry.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/usecases/signup_user_usecase.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  CacheHelper.sharedPreferences = sharedPreferences; // ⬅️ دي اللي ناسيها غالباً
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.interceptors.add(sl<LoggerInterceptor>());
    return DioConsumer(dio: dio);
  });

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => Connectivity());

  sl.registerLazySingleton<SignupUserRepository>(
      () => SignupUserRepositoryImpli(dioConsumer: sl()));
  sl.registerLazySingleton(
      () => SignupUserUsecase(signupUserRepository: sl()));
  sl.registerFactory(() => SignupUserCubit(sl()));
}
