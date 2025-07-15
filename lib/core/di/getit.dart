import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/interceptors.dart';
import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_local.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_remote.dart';
import 'package:bank_system/features/home/data/repositires/home_repositiry_impli.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:bank_system/features/home/domain/usecases/add_account_usecase.dart';
import 'package:bank_system/features/home/domain/usecases/category_usecase.dart';
import 'package:bank_system/features/home/domain/usecases/deposit_usecase.dart';
import 'package:bank_system/features/home/presentation/manegar/cubit/add_account_cubit.dart';
import 'package:bank_system/features/home/presentation/manegar/deposit_cubit/cubit/deposit_cubit.dart';
import 'package:bank_system/features/home/presentation/manegar/home_cubit/home_cubit.dart';
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
  CacheHelper.sharedPreferences = sharedPreferences;

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper()); // ⬅️ السطر المهم

  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.interceptors.add(sl<LoggerInterceptor>());
    return DioConsumer(dio: dio);
  });

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => Connectivity());

  sl.registerLazySingleton<SignupUserRepository>(
    () => SignupUserRepositoryImpli(dioConsumer: sl()),
  );

  sl.registerLazySingleton<CategoriesDataSourceLocal>(
    () => CategoriesDataSourceLocal(cache: sl()), // الآن CacheHelper موجود
  );

  sl.registerLazySingleton<CategoriesDataSourceRemote>(
    () => CategoriesDataSourceRemote(dioConsumer: sl()),
  );

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositiryImpli(
    sl(),
    networkInfo: sl(),
    remote: sl(),
    local: sl(),
  ));

  sl.registerLazySingleton(() => CategoryUsecase(categoryRepository: sl()));
    sl.registerLazySingleton(() => AddAccountUsecase( sl()));

    sl.registerLazySingleton(() => DepositUsecase( sl()));

  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerFactory(() => AddAccountCubit(sl()));
  sl.registerFactory(() => AddAccountCubit(sl()));

  sl.registerLazySingleton(() => SignupUserUsecase(signupUserRepository: sl()));
  sl.registerFactory(() => SignupUserCubit(sl()));

   sl.registerFactory(() => DepositCubit(sl(),sl()));
}
