// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomeExpenseModelImpl _$$IncomeExpenseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IncomeExpenseModelImpl(
      category: json['category'] as String?,
      amount: json['amount'] as String,
      month: json['month'] as String,
      note: json['note'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$IncomeExpenseModelImplToJson(
        _$IncomeExpenseModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amount': instance.amount,
      'month': instance.month,
      'note': instance.note,
      'date': instance.date,
    };
