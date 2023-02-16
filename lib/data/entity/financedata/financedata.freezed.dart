// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financedata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Financedata _$FinancedataFromJson(Map<String, dynamic> json) {
  return _Financedata.fromJson(json);
}

/// @nodoc
mixin _$Financedata {
  int get id => throw _privateConstructorUsedError;
  String get operationName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get operationDate => throw _privateConstructorUsedError;
  double get operationTotal => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  int get idCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancedataCopyWith<Financedata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancedataCopyWith<$Res> {
  factory $FinancedataCopyWith(
          Financedata value, $Res Function(Financedata) then) =
      _$FinancedataCopyWithImpl<$Res, Financedata>;
  @useResult
  $Res call(
      {int id,
      String operationName,
      String description,
      String operationDate,
      double operationTotal,
      bool isDeleted,
      int idCategory});
}

/// @nodoc
class _$FinancedataCopyWithImpl<$Res, $Val extends Financedata>
    implements $FinancedataCopyWith<$Res> {
  _$FinancedataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operationName = null,
    Object? description = null,
    Object? operationDate = null,
    Object? operationTotal = null,
    Object? isDeleted = null,
    Object? idCategory = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      operationName: null == operationName
          ? _value.operationName
          : operationName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      operationDate: null == operationDate
          ? _value.operationDate
          : operationDate // ignore: cast_nullable_to_non_nullable
              as String,
      operationTotal: null == operationTotal
          ? _value.operationTotal
          : operationTotal // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FinancedataCopyWith<$Res>
    implements $FinancedataCopyWith<$Res> {
  factory _$$_FinancedataCopyWith(
          _$_Financedata value, $Res Function(_$_Financedata) then) =
      __$$_FinancedataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String operationName,
      String description,
      String operationDate,
      double operationTotal,
      bool isDeleted,
      int idCategory});
}

/// @nodoc
class __$$_FinancedataCopyWithImpl<$Res>
    extends _$FinancedataCopyWithImpl<$Res, _$_Financedata>
    implements _$$_FinancedataCopyWith<$Res> {
  __$$_FinancedataCopyWithImpl(
      _$_Financedata _value, $Res Function(_$_Financedata) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operationName = null,
    Object? description = null,
    Object? operationDate = null,
    Object? operationTotal = null,
    Object? isDeleted = null,
    Object? idCategory = null,
  }) {
    return _then(_$_Financedata(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      operationName: null == operationName
          ? _value.operationName
          : operationName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      operationDate: null == operationDate
          ? _value.operationDate
          : operationDate // ignore: cast_nullable_to_non_nullable
              as String,
      operationTotal: null == operationTotal
          ? _value.operationTotal
          : operationTotal // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Financedata implements _Financedata {
  const _$_Financedata(
      {required this.id,
      required this.operationName,
      required this.description,
      required this.operationDate,
      required this.operationTotal,
      required this.isDeleted,
      required this.idCategory});

  factory _$_Financedata.fromJson(Map<String, dynamic> json) =>
      _$$_FinancedataFromJson(json);

  @override
  final int id;
  @override
  final String operationName;
  @override
  final String description;
  @override
  final String operationDate;
  @override
  final double operationTotal;
  @override
  final bool isDeleted;
  @override
  final int idCategory;

  @override
  String toString() {
    return 'Financedata(id: $id, operationName: $operationName, description: $description, operationDate: $operationDate, operationTotal: $operationTotal, isDeleted: $isDeleted, idCategory: $idCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Financedata &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.operationName, operationName) ||
                other.operationName == operationName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.operationDate, operationDate) ||
                other.operationDate == operationDate) &&
            (identical(other.operationTotal, operationTotal) ||
                other.operationTotal == operationTotal) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, operationName, description,
      operationDate, operationTotal, isDeleted, idCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinancedataCopyWith<_$_Financedata> get copyWith =>
      __$$_FinancedataCopyWithImpl<_$_Financedata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FinancedataToJson(
      this,
    );
  }
}

abstract class _Financedata implements Financedata {
  const factory _Financedata(
      {required final int id,
      required final String operationName,
      required final String description,
      required final String operationDate,
      required final double operationTotal,
      required final bool isDeleted,
      required final int idCategory}) = _$_Financedata;

  factory _Financedata.fromJson(Map<String, dynamic> json) =
      _$_Financedata.fromJson;

  @override
  int get id;
  @override
  String get operationName;
  @override
  String get description;
  @override
  String get operationDate;
  @override
  double get operationTotal;
  @override
  bool get isDeleted;
  @override
  int get idCategory;
  @override
  @JsonKey(ignore: true)
  _$$_FinancedataCopyWith<_$_Financedata> get copyWith =>
      throw _privateConstructorUsedError;
}
