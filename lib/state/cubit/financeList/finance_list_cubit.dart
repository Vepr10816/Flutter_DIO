import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio/common/app_env.dart';
import 'package:flutter_dio/data/entity/financedata/financedata.dart';
import 'finance_list_state.dart';

class FinanceListCubit extends Cubit<FinanceListState> {
  FinanceListCubit(this.dio)
      : super(FinanceListState(operationNameList: [], idFinanceList: []));

  final Dio dio;

  Future<void> deleteFromFinanceList(int index) async {
    List operations = state.operationNameList;
    List idOperations = state.idFinanceList;
    try {
      var result = await dio
          .delete(AppEnv.financeUPDorDEL + idOperations[index].toString());
      if (result.statusCode == 200) {
        operations.removeAt(index);
        idOperations.removeAt(index);
        emit(FinanceListState(
            operationNameList: operations, idFinanceList: idOperations));
      }
    } on DioError catch (e) {}
  }

  Future<void> updateFinanceList(int index, String newName) async {
    List operations = state.operationNameList;
    List idOperations = state.idFinanceList;
    operations[index] = newName;
    emit(FinanceListState(operationNameList: operations, idFinanceList: idOperations));
  }

  Future<void> getFinanceList() async {
    try {
      var result = await dio.get(AppEnv.finance);

      List operations = state.operationNameList;
      List idOperations = state.idFinanceList;
      operations.clear();
      idOperations.clear();
      for (int i = 0; i < result.data.length; i++) {
        var data = Financedata.fromJson(result.data[i]);
        operations.add(data.operationName);
        idOperations.add(data.id);
      }

      /*List<Financedata> test =
          (result.data as List).map((e) => Financedata.fromJson(e)).toList();

      List idOperations = state.idFinanceList;
      idOperations.clear();
      for (int i = 0; i < result.data.length; i++) {
        var data = Financedata.fromJson(result.data[i]);
        idOperations.add(data.id);
      }*/
      if (result.statusCode == 200) {
        emit(FinanceListState(
            operationNameList: operations, idFinanceList: idOperations));
      }
    } on DioError catch (e) {}
  }

  int getID(int index) {
    List idOperations = state.idFinanceList;
    return idOperations[index];
  }
}
