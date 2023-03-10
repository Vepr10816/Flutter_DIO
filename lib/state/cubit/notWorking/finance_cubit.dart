import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio/common/app_env.dart';
import 'package:flutter_dio/data/entity/financedata/financedata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



part 'finance_state.dart';

/*class FinanceCubit extends Cubit<FinanceState> {
  FinanceCubit(this.dio) : super(InitialState()) ;

  final Dio dio;
  
  Future<void> Delete(int index) async {
    FinanceListState fl = FinanceListState();
    List operations = ;
    List idOperations = state.idFinanceList;
    try {
      var result = await dio
          .delete(AppEnv.financeUPDorDEL + idOperations[index].toString());
      if (result.statusCode == 200) {
        operations.removeAt(index);
        idOperations.removeAt(index);
        emit(ListState(
            operationNameList: operations, idFinanceList: idOperations));
      }
    } on DioError catch (e) {}
  }

  Future<void> Update(int index, String newName) async {
    List operations = state.operationNameList;
    List idOperations = state.idFinanceList;
    operations[index] = newName;
    emit(ListState(operationNameList: operations, idFinanceList: idOperations));
  }

  Future<void> MyFinance() async {
    try {
      var result = await dio.get(AppEnv.finance);

      List operations = state.operationNameList;
      operations.clear();
      for (int i = 0; i < result.data.length; i++) {
        var data = Financedata.fromJson(result.data[i]);
        operations.add(data.operationName);
      }

      List<Financedata> test =
          (result.data as List).map((e) => Financedata.fromJson(e)).toList();

      List idOperations = state.idFinanceList;
      idOperations.clear();
      for (int i = 0; i < result.data.length; i++) {
        var data = Financedata.fromJson(result.data[i]);
        idOperations.add(data.id);
      }
      if (result.statusCode == 200) {
        //List history = state.history;
        //history.add(data.operationName);
        emit(ListState(
            operationNameList: operations, idFinanceList: idOperations));
        // SharedPreferencesUtil.saveData<String>("accessToken", data.accessToken!);
      }
    } on DioError catch (e) {}
  }

  int getID(int index) {
    List idOperations = state.idFinanceList;
    return idOperations[index];
  }
  

  
}*/
