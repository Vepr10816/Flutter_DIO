
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/app_env.dart';
import 'core/auth_interceptor.dart';
import 'state/cubit/auth/auth_cubit.dart';
import 'state/cubit/financeList/finance_list_cubit.dart';
import 'state/cubit/financeParametrs/finance_parametrs_cubit.dart';
import 'state/cubit/profile/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async{

  sl.registerLazySingleton(()=>AuthCubit(sl()));
  sl.registerLazySingleton(()=>FinanceListCubit(sl()));
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