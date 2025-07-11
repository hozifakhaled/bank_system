import 'package:bank_system/core/connections/network_info.dart';
import 'package:bank_system/core/databases/api/dio_consumer.dart';
import 'package:bank_system/core/databases/api/interceptors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void setup() async {

    final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // Interceptor
  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // Dio + LoggerInterceptor
  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.interceptors.add(sl<LoggerInterceptor>());
    return DioConsumer(dio: dio);
  });
  
 
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
   sl.registerLazySingleton(() => Connectivity());
  // Datasource
 

}
