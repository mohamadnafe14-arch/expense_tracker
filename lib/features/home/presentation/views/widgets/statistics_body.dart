import 'package:expense_tracker/core/functions/show_error_toast.dart';
import 'package:expense_tracker/core/widgets/loading_body.dart';
import 'package:expense_tracker/features/home/presentation/viewmodel/home_cubit/home_cubit.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/tranactions_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsBody extends StatelessWidget {
  const StatisticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
            "Statistics",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const LoadingBody();
                } else if (state is HomeLoaded) {
                  if (state.groupData.isEmpty) {
                    return Center(child: Text('No data to show'));
                  }
                  return TranactionsChart(expenses: state.groupData);
                } else if (state is HomeError) {
                  showErrorToast(context: context, message: state.message);
                  return Center(child: Text('Something went wrong'));
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
