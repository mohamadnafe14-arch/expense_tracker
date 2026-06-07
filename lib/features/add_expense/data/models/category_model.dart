import 'package:flutter/material.dart';

@immutable
class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;
  final String iconFontFamily;
  const CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.iconFontFamily,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'icon': icon.codePoint,
      'color': color.toARGB32(),
      'iconFontFamily': iconFontFamily,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      icon: IconData(map['icon'], fontFamily: map['iconFontFamily']),
      color: Color(map['color']),
      iconFontFamily: map['iconFontFamily'],
    );
  }
}
