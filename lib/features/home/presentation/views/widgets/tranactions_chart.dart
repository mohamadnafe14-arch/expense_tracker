import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TranactionsChart extends StatefulWidget {
  const TranactionsChart({super.key});

  @override
  State<TranactionsChart> createState() => _TranactionsChartState();
}

class _TranactionsChartState extends State<TranactionsChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(tranactionData());
  }

  BarChartData tranactionData() {
    List<BarChartGroupData> barGroups = [
      createBarGroup(0, 5),
      createBarGroup(1, 8),
      createBarGroup(2, 6),
      createBarGroup(3, 4),
      createBarGroup(4, 7),
      createBarGroup(5, 6),
    ];
    return BarChartData(
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: titleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: leftTitles,
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      barGroups: barGroups,
      borderData: FlBorderData(show: false),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 2,
      ),
    );
  }

  Widget titleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      meta: meta,
      child: Text(
        value.toInt().toString(),
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  BarChartGroupData createBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16,
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
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
        ),
      ],
    );
  }
}

Widget leftTitles(double value, TitleMeta meta) {
  return SideTitleWidget(
    meta: meta,
    child: Text(
      value.toInt().toString(),
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    ),
  );
}
