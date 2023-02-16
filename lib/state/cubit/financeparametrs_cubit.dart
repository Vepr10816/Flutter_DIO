import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio/presentation/screen/financedata/finance_data.dart';

import '../../common/app_env.dart';
import '../../financedata.dart';
import '../../user.dart';
import 'financeparametrs_state.dart';
import 'list_state.dart';

class FinanceParametrsCubit extends Cubit<FinanceParametrsState> {
  FinanceParametrsCubit(this.dio) : super(FinanceParametrsState(id: 0, operationName: '', description: '', operationDate: '', operationTotal: 0, isDeleted: false, idCategory: 1, ));
 
  final Dio dio;

  Future<void> addFinance(Financedata financedata)async{
    try{
      var result = await dio.post(AppEnv.finance,data: financedata);
      
      //var data = Financedata.fromJson(result.data);

      if(result.statusCode == 200){
        print('Добавил финансы');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  Future<void> updateFinance(Financedata financedata)async{
    try{
      var result = await dio.put(AppEnv.financeUPDorDEL+financedata.id.toString(),data: financedata);
      
      //var data = Financedata.fromJson(result.data);

      if(result.statusCode == 200){
        print('Изменил финансы');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  Future<void> logicalDelete(int id)async{
    try{
      var result = await dio.put(AppEnv.logicalDelete+'/'+id.toString());
      
      //var data = Financedata.fromJson(result.data);

      if(result.statusCode == 200){
        print('Логично удалил');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  Future<void> logicalReturn()async{
    try{
      var result = await dio.put(AppEnv.logicalDelete);
      
      //var data = Financedata.fromJson(result.data);

      if(result.statusCode == 200){
        print('Логично восстановил');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  Future<void> GetFinance(int id)async{
    try{
      var result = await dio.get(AppEnv.financeUPDorDEL+id.toString());
      var data = Financedata.fromJson(result.data);
      if(result.statusCode == 200){
        emit(FinanceParametrsState(id: id,operationName: data.operationName, description: data.description, operationDate: data.operationDate, operationTotal: data.operationTotal, isDeleted: false, idCategory: 1, ));
      }
    } on DioError catch(e){
    }
  }

  

  
}