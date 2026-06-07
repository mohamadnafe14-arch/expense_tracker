import 'package:expense_tracker/features/home/data/models/group_data_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TranactionsChart extends StatelessWidget {
  const TranactionsChart({super.key, required this.expenses});

  final List<GroupDataModel> expenses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 250, child: BarChart(_transactionData(context)));
  }

  BarChartData _transactionData(BuildContext context) {
    final maxY = expenses.isEmpty
        ? 10.0
        : expenses.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    return BarChartData(
      maxY: maxY * 1.2,
      borderData: FlBorderData(show: false),

      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: maxY / 5,
      ),

      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: maxY / 5,
            getTitlesWidget: _leftTitles,
          ),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _bottomTitles,
          ),
        ),
      ),

      barGroups: [
        for (int i = 0; i < expenses.length; i++)
          _createBarGroup(context, i, expenses[i].y),
      ],
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    final index = value.toInt();

    if (index < 0 || index >= expenses.length) {
      return const SizedBox();
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(
        expenses[index].x.toString(),
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }

  static Widget _leftTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      child: Text(
        value.toInt().toString(),
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }

  BarChartGroupData _createBarGroup(BuildContext context, int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 18,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
          ),
        ),
      ],
    );
  }
}
