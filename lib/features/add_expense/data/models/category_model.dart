import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;

  const CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
  });
  Map<String, dynamic> toMap() {
    return {'name': name, 'icon': icon.codePoint, 'color': color.toARGB32()};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      // ignore: non_const_argument_for_const_parameter
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      color: Color(map['color']),
    );
  }
}
