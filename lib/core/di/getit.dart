import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/interceptors.dart';
import 'package:bank_system/core/databases/cache/cache_helper.dart';
import 'package:bank_system/features/deposits/data/repositeries/deposit_repo_impli.dart';
import 'package:bank_system/features/deposits/domian/repositreies/deposits_repo.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_local.dart';
import 'package:bank_system/features/home/data/datasource/categories_data_source_remote.dart';
import 'package:bank_system/features/home/data/repositires/home_repositiry_impli.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:bank_system/features/home/domain/usecases/add_account_usecase.dart';
import 'package:bank_system/features/home/domain/usecases/balance_usecase.dart';
import 'package:bank_system/features/home/domain/usecases/category_usecase.dart';
import 'package:bank_system/features/deposits/domian/usecase/deposit_usecase.dart';
import 'package:bank_system/features/deposits/domian/usecase/upload_pdf_usecase.dart';
import 'package:bank_system/features/home/domain/usecases/withdarw_usecase.dart';
import 'package:bank_system/features/home/presentation/manegar/add_account_cubit/add_account_cubit.dart';
import 'package:bank_system/features/home/presentation/manegar/balance_cubit/balance_cubit.dart';
import 'package:bank_system/features/home/presentation/manegar/cubit/add_pdf_cubit.dart';
import 'package:bank_system/features/deposits/presentation/manger/deposit_cubit/cubit/deposit_cubit.dart';
import 'package:bank_system/features/home/presentation/manegar/home_cubit/home_cubit.dart';
import 'package:bank_system/features/profile/data/datasources/get_profile_data_source_local.dart';
import 'package:bank_system/features/profile/data/datasources/get_profile_data_source_remote.dart';
import 'package:bank_system/features/profile/data/repo/profile_repo_impli.dart';
import 'package:bank_system/features/profile/domain/repositres/profile_repo.dart';
import 'package:bank_system/features/profile/domain/usecases/get_profile.dart';
import 'package:bank_system/features/profile/persentation/cubit/get_profile_cubit.dart';
import 'package:bank_system/features/user_auth/login_user/data/repositories/login_repo.dart';
import 'package:bank_system/features/user_auth/login_user/presentation/cubit/login_user_cubit.dart';
import 'package:bank_system/features/user_auth/signup_user/data/repositories/signup_user_repository_impli.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/repositories/signup_user_repositry.dart';
import 'package:bank_system/features/user_auth/signup_user/domain/usecases/signup_user_usecase.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:bank_system/features/withdraws/data/repositiries/withdraw_repositiry_impli.dart';
import 'package:bank_system/features/withdraws/domian/repositires/withdraw_repo.dart';
import 'package:bank_system/features/withdraws/presentation/manger/cubit/withdraw_cubit.dart';
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
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(dioConsumer: sl()));
  sl.registerLazySingleton<DepositsRepository>(() => DepositRepoImpli(sl()));
  sl.registerLazySingleton<WithdrawRepo>(
    () => WithdrawRepositiryImpli(dioConsumer: sl(), networkInfo: sl())
  );
  sl.registerLazySingleton<HomeRepository>(
    () =>
        HomeRepositiryImpli(sl(), networkInfo: sl(), remote: sl(), local: sl()),
  );
    sl.registerLazySingleton<ProfileRepo>(
    () =>
        ProfileRepoImpli(sl(), sl(),  sl())
  );


  sl.registerLazySingleton<CategoriesDataSourceLocal>(
    () => CategoriesDataSourceLocal(cache: sl()), // الآن CacheHelper موجود
  );


  sl.registerLazySingleton<CategoriesDataSourceRemote>(
    () => CategoriesDataSourceRemote(dioConsumer: sl()),
  );
 sl.registerLazySingleton<GetProfileDataSourceLocal>(
    () => GetProfileDataSourceLocal(cache: sl()),
  );
  sl.registerLazySingleton<GetProfileDataSourceRemote>(
    () => GetProfileDataSourceRemote(dioConsumer: sl()),
  );

  sl.registerLazySingleton(() => CategoryUsecase(categoryRepository: sl()));
  sl.registerLazySingleton(() => AddAccountUsecase(sl()));

  sl.registerLazySingleton(() => DepositUsecase(sl()));
    sl.registerLazySingleton(() => WithdarwUsecase(sl()));

  sl.registerLazySingleton(() => BalanceUsecase(homeRepositiry: sl()));
  sl.registerLazySingleton(() => UploadPdfUsecase(sl()));
    sl.registerLazySingleton(() => GetProfile(sl()));


  sl.registerFactory(() => LoginUserCubit(sl()));

  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerFactory(() => AddAccountCubit(sl()));

  sl.registerLazySingleton(() => SignupUserUsecase(signupUserRepository: sl()));
  sl.registerFactory(() => SignupUserCubit(sl()));

  sl.registerFactory(() => DepositCubit(sl(), sl()));
    sl.registerFactory(() => WithdrawCubit(sl(), sl()));

  sl.registerFactory(() => BalanceCubit(sl()));
  sl.registerFactory(() => AddPdfCubit(sl()));
    sl.registerFactory(() => GetProfileCubit(sl()));

}
