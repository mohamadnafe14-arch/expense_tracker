import 'package:expense_tracker/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: const Color(0xff00b2e7),
          secondary: const Color(0xffe064f7),
          tertiary: const Color(0xffff8d6c),
          outline: Colors.grey,
        ),
      ),
      home: const HomeView(),
    );
  }
}
