import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_expense_model.freezed.dart';
part 'income_expense_model.g.dart';

@freezed
class IncomeExpenseModel with _$IncomeExpenseModel{

  const factory IncomeExpenseModel({
    String? category,
    required String amount,
    required String month,
    required String note,
    required String date,
  }) = _IncomeExpenseModel;

  factory IncomeExpenseModel.fromJson(Map<String, dynamic> json) => _$IncomeExpenseModelFromJson(json);
  
}



// amount
// 12000
// (number)


// category
// null
// (null)


// createdAt
// "2024-02-19T09:51:01.996167"
// (string)


// date
// "2024-02"
// (string)


// description
// "Nepali rs"
// (string)


// type
// "income"
// (string)


// uid
// "7zDT5GQFuog8au7nce6dzFwK3nC3"
// (string)