// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IncomeExpenseModel _$IncomeExpenseModelFromJson(Map<String, dynamic> json) {
  return _IncomeExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$IncomeExpenseModel {
  String? get category => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeExpenseModelCopyWith<IncomeExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeExpenseModelCopyWith<$Res> {
  factory $IncomeExpenseModelCopyWith(
          IncomeExpenseModel value, $Res Function(IncomeExpenseModel) then) =
      _$IncomeExpenseModelCopyWithImpl<$Res, IncomeExpenseModel>;
  @useResult
  $Res call(
      {String? category,
      String amount,
      String month,
      String note,
      String date});
}

/// @nodoc
class _$IncomeExpenseModelCopyWithImpl<$Res, $Val extends IncomeExpenseModel>
    implements $IncomeExpenseModelCopyWith<$Res> {
  _$IncomeExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? amount = null,
    Object? month = null,
    Object? note = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeExpenseModelImplCopyWith<$Res>
    implements $IncomeExpenseModelCopyWith<$Res> {
  factory _$$IncomeExpenseModelImplCopyWith(_$IncomeExpenseModelImpl value,
          $Res Function(_$IncomeExpenseModelImpl) then) =
      __$$IncomeExpenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? category,
      String amount,
      String month,
      String note,
      String date});
}

/// @nodoc
class __$$IncomeExpenseModelImplCopyWithImpl<$Res>
    extends _$IncomeExpenseModelCopyWithImpl<$Res, _$IncomeExpenseModelImpl>
    implements _$$IncomeExpenseModelImplCopyWith<$Res> {
  __$$IncomeExpenseModelImplCopyWithImpl(_$IncomeExpenseModelImpl _value,
      $Res Function(_$IncomeExpenseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? amount = null,
    Object? month = null,
    Object? note = null,
    Object? date = null,
  }) {
    return _then(_$IncomeExpenseModelImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeExpenseModelImpl implements _IncomeExpenseModel {
  const _$IncomeExpenseModelImpl(
      {this.category,
      required this.amount,
      required this.month,
      required this.note,
      required this.date});

  factory _$IncomeExpenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeExpenseModelImplFromJson(json);

  @override
  final String? category;
  @override
  final String amount;
  @override
  final String month;
  @override
  final String note;
  @override
  final String date;

  @override
  String toString() {
    return 'IncomeExpenseModel(category: $category, amount: $amount, month: $month, note: $note, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeExpenseModelImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, amount, month, note, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeExpenseModelImplCopyWith<_$IncomeExpenseModelImpl> get copyWith =>
      __$$IncomeExpenseModelImplCopyWithImpl<_$IncomeExpenseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeExpenseModelImplToJson(
      this,
    );
  }
}

abstract class _IncomeExpenseModel implements IncomeExpenseModel {
  const factory _IncomeExpenseModel(
      {final String? category,
      required final String amount,
      required final String month,
      required final String note,
      required final String date}) = _$IncomeExpenseModelImpl;

  factory _IncomeExpenseModel.fromJson(Map<String, dynamic> json) =
      _$IncomeExpenseModelImpl.fromJson;

  @override
  String? get category;
  @override
  String get amount;
  @override
  String get month;
  @override
  String get note;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$IncomeExpenseModelImplCopyWith<_$IncomeExpenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
