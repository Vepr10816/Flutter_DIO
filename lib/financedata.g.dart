// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financedata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Financedata _$$_FinancedataFromJson(Map<String, dynamic> json) =>
    _$_Financedata(
      id: json['id'] as int,
      operationName: json['operationName'] as String,
      description: json['description'] as String,
      operationDate: json['operationDate'] as String,
      operationTotal: (json['operationTotal'] as num).toDouble(),
      isDeleted: json['isDeleted'] as bool,
      idCategory: json['idCategory'] as int,
    );

Map<String, dynamic> _$$_FinancedataToJson(_$_Financedata instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operationName': instance.operationName,
      'description': instance.description,
      'operationDate': instance.operationDate,
      'operationTotal': instance.operationTotal,
      'isDeleted': instance.isDeleted,
      'idCategory': instance.idCategory,
    };
