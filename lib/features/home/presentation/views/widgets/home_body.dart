import 'package:expense_tracker/core/functions/show_error_toast.dart';
import 'package:expense_tracker/core/widgets/loading_body.dart';
import 'package:expense_tracker/features/add_expense/presentation/views/add_expense_view.dart';
import 'package:expense_tracker/features/home/presentation/viewmodel/home_cubit/home_cubit.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/calculation_widget.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/category_list.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/profile_bar.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/tranaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ProfileBar()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return SliverToBoxAdapter(child: LoadingBody());
                } else if (state is HomeLoaded) {
                  return SliverToBoxAdapter(
                    child: CalculationWidget(
                      calculateModel: state.calculations,
                    ),
                  );
                } else if (state is HomeError) {
                  showErrorToast(context: context, message: state.message);
                  return SliverToBoxAdapter(
                    child: Text('Something went wrong'),
                  );
                }
                return SliverToBoxAdapter(child: SizedBox());
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
              child: Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(child: CategoryList()),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return SliverToBoxAdapter(child: LoadingBody());
                } else if (state is HomeLoaded) {
                  if (state.expenses.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'No transactions yet',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddExpenseView(),
                                  ),
                                );
                              },
                              child: Text('Add the first one'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return TranacionList(expenses: state.expenses);
                } else if (state is HomeError) {
                  showErrorToast(context: context, message: state.message);
                  return SliverToBoxAdapter(
                    child: Text('Something went wrong'),
                  );
                }
                return SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}
