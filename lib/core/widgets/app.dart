import 'package:expense_tracker/core/utils/dependecy_injection.dart';
import 'package:expense_tracker/features/home/data/repos/home_repo.dart';
import 'package:expense_tracker/features/home/presentation/viewmodel/home_cubit/home_cubit.dart';
import 'package:expense_tracker/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (context) => HomeCubit(homeRepo: getIt<HomeRepo>())..loadHome(),
        child: const HomeView(),
      ),
    );
  }
}
