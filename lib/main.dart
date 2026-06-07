import 'package:expense_tracker/core/utils/dependecy_injection.dart';
import 'package:expense_tracker/core/widgets/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}
