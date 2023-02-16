
import 'package:dio/dio.dart';
import 'package:flutter_dio/state/cubit/auth_cubit.dart';
import 'package:flutter_dio/state/cubit/financeparametrs_cubit.dart';
import 'package:flutter_dio/state/cubit/list_cubit.dart';
import 'package:flutter_dio/state/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/app_env.dart';
import 'core/auth_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async{

  sl.registerLazySingleton(()=>AuthCubit(sl()));
  sl.registerLazySingleton(()=>ListCubit(sl()));
  sl.registerLazySingleton(()=>FinanceParametrsCubit(sl()));
  sl.registerLazySingleton(()=>ProfileCubit(sl()));
  final shared_preferences = SharedPreferences.getInstance();
  sl.registerLazySingleton(() => shared_preferences);

  sl.registerLazySingleton((){
  final dio = Dio(
    BaseOptions(
        sendTimeout: 1500, 
        connectTimeout: 1500,
        receiveTimeout: 1500,
        baseUrl: '${AppEnv.protocol}://${AppEnv.ip}',
      ),
  );
  dio.interceptors.add(AuthInterceptor());
  return dio;
  });

}