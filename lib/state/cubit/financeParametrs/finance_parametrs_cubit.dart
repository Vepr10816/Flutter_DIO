import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio/common/app_env.dart';
import 'package:flutter_dio/data/entity/financedata/financedata.dart';
import 'financeparametrs_state.dart';

class FinanceParametrsCubit extends Cubit<FinanceParametrsState> {
  FinanceParametrsCubit(this.dio) : super(FinanceParametrsState(id: 0, description: '', operationName: '', operationDate: '', operationTotal: 0, isDeleted: false, idCategory: 0, categotyNameList: [], idCategoryList: []));
 
  final Dio dio;

  Future<void> addFinance(Financedata financedata)async{
    try{
      var response = await dio.post(AppEnv.finance,data: financedata);
      if(response.statusCode == 200){
        print('Добавил финансы');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  Future<void> updateFinanceParametrs(Financedata financedata)async{
    try{
      var response = await dio.put(AppEnv.financeUPDorDEL+financedata.id.toString(),data: financedata);
      if(response.statusCode == 200){
        print('Изменил финансы');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  Future<void> logicalDelete(int id)async{
    try{
      var response = await dio.put(AppEnv.logicalDelete+'/'+id.toString());
      if(response.statusCode == 200){
        print('Логично удалил');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  Future<void> logicalReturn()async{
    try{
      var response = await dio.put(AppEnv.logicalDelete);
      if(response.statusCode == 200){
        print('Логично восстановил');
      }
    } on DioError catch(e){
      print(e.response!.data['message']);
    }
  }

  String getCategoryFromID(int categoryID) {
    List idCategoryList = state.idCategoryList;
    List<String> categoryList = state.categotyNameList;
    categoryID = idCategoryList.indexOf(categoryID);
    return categoryList[categoryID];
  }

  int getIDCategoryFromName(String nameCategory) {
    List idCategoryList = state.idCategoryList;
    List<String> categoryList = state.categotyNameList;
    int index = categoryList.indexOf(nameCategory);
    return idCategoryList[index];
  }

  Future<void> getCategories() async{
    var response = await dio.get(AppEnv.category);
          if(response.statusCode == 200){
            List<String> categoryList = state.categotyNameList;
            List idCategoryList = state.idCategoryList;
            categoryList.clear();
            idCategoryList.clear();
            for (int i = 0; i < response.data.length; i++) {
              var data = response.data[i];
              categoryList.add(data['categoryName'].toString());
              idCategoryList.add(data['id']);
            }
            emit(FinanceParametrsState(id: state.id,operationName: state.operationName, description: state.description, operationDate: state.operationDate, operationTotal: state.operationTotal, isDeleted: false, idCategory: state.idCategory, categotyNameList: categoryList, idCategoryList: idCategoryList));
          }
  }

  Future<void> getFinanceParametrs(int id)async{
    try{
      var response = await dio.get(AppEnv.financeUPDorDEL+id.toString());
      var data = Financedata.fromJson(response.data);
      if(response.statusCode == 200){
          int categoryid = response.data['category']['id'];
          emit(FinanceParametrsState(id: id,operationName: data.operationName, description: data.description, operationDate: data.operationDate, operationTotal: data.operationTotal, isDeleted: false, idCategory: categoryid, categotyNameList: [], idCategoryList: []));
        
      }
    } on DioError catch(e){
    }
  }

  

  
}