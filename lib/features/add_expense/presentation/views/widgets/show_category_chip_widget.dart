import 'package:expense_tracker/features/add_expense/data/models/category_model.dart';
import 'package:flutter/material.dart';

class ShowCategoryChipWidget extends StatelessWidget {
  const ShowCategoryChipWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(categoryModel.icon),
        const SizedBox(width: 10),
        Text(categoryModel.name),
        const SizedBox(width: 10),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: categoryModel.color,
          ),
        ),
      ],
    );
  }
}
