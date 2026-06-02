import 'package:expense_tracker/core/utils/dependecy_injection.dart';
import 'package:expense_tracker/core/widgets/app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const App());
}
