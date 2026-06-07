import 'package:expense_tracker/features/add_expense/data/models/category_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class ExpenseModel {
  final String id;
  final double amount;
  final String date;
  final List<CategoryModel> categories;
  final String transactionType;
  const ExpenseModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.categories,
    required this.transactionType,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'date': date,
      'categories': categories.map((category) => category.toMap()).toList(),
      'transactionType': transactionType,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      amount: (map['amount'] as num).toDouble(),
      date: map['date'],
      categories: (map['categories'] as List)
          .map((category) => CategoryModel.fromMap(category))
          .toList(),
      transactionType: map['transactionType'],
    );
  }
}
