import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio/presentation/screen/financedata/finance_data.dart';

import '../../common/app_env.dart';
import '../../financedata.dart';
import '../../user.dart';
import 'Profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.dio) : super(ProfileState(userName: '', email: ''));
 
  final Dio dio;

   Future<void> GetUser()async{
      try{
        var result = await dio.get(AppEnv.userData);
        var data = User.fromJson(result.data);
        if(result.statusCode == 200){
          emit(ProfileState(userName: data.userName,email: data.email!));
        }
      } on DioError catch(e){
      }
    }

    Future<void> updateUserData(User user)async{
    try{
      var result = await dio.post(AppEnv.userData,data: user);
      
      //var data = Financedata.fromJson(result.data);

      if(result.statusCode == 200){
        print('Изменил данные пользователя');
        var result = await dio.get(AppEnv.userData);
        var data = User.fromJson(result.data);
        if(result.statusCode == 200){
          emit(ProfileState(userName: data.userName,email: data.email!));
        }
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
    }

    Future<void> updateUserPassword(String oldPassword, String newPassword)async{
    try{
      var result = await dio.put(AppEnv.userData+'?newPassword='+newPassword+'&oldPassword='+oldPassword);
      
      //var data = Financedata.fromJson(result.data);

      if(result.statusCode == 200){
        print('Изменил данные пользователя');
      }
      else
      {
        print('Старый пароль не тот');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
    }

  
}