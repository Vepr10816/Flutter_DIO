import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/app_env.dart';
import '../../user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.dio) : super(InitialState());

  final Dio dio;
  
  Future<void> singUp(User user)async{
    try{
      var result = await dio.put(AppEnv.auth,data: user);

      var data = User.fromJson(result.data['data']);
      if(result.statusCode == 200){
        if(data.token == null){
          throw DioError(requestOptions: RequestOptions(path: ''),error: 'Токен равен нулю');
        }
        emit(SuccesState());
      }
    } on DioError catch(e){
      emit(ErrorState(e.response!.data['message']));
    }
  }

  Future<void> singIn(User user)async{
    try{
      var result = await dio.post(AppEnv.auth,data: user);

      var data = User.fromJson(result.data['data']);
      if(result.statusCode == 200){
        if(data.token == null){
          throw DioError(requestOptions: RequestOptions(path: ''),error: 'Токен равен нулю');
        }
        emit(SuccesState());
      }
    } on DioError catch(e){
      emit(ErrorState(e.response!.data['message']));
    }
  }
}
