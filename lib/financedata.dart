import 'package:flutter_dio/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'financedata.freezed.dart';
part 'financedata.g.dart';

@freezed
class Financedata with _$Financedata{

  const factory Financedata(
  {
    required int id,
    required String operationName,
    required String description,
    required String operationDate,
    required double operationTotal,
    required bool isDeleted,
    required int idCategory

  }
  ) = _Financedata;

  factory Financedata.fromJson(Map<String,dynamic> json) => _$FinancedataFromJson(json); 
}
//flutter pub run build_runner build