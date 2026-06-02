import 'package:expense_tracker/features/add_expense/data/models/category_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class ExpenseModel {
  final int id;
  final double amount;
  final String date;
  final List<CategoryModel> categories;
  const ExpenseModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.categories,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'date': date,
      'categories': categories.map((category) => category.toMap()).toList(),
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      amount: map['amount'],
      date: map['date'],
      categories: (map['categories'] as List)
          .map((category) => CategoryModel.fromMap(category))
          .toList(),
    );
  }
}
