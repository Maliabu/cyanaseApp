import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GoalChartPage extends StatelessWidget {
  GoalChartPage({super.key});

  final List<_SeriesData> seriesList = [
    _SeriesData('Series 1', [1, 3, 2, 4], Colors.amber),
    _SeriesData('Series 2', [2, 2.5, 3, 3.5], Colors.amber[300]!),
    _SeriesData('Series 3', [1.5, 2, 2.5, 3], Colors.amber[400]!),
    _SeriesData('Series 4', [3, 2, 1.5, 1], Colors.amber[500]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              groupsSpace: 12,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        'Q${value.toInt() + 1}',
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                    interval: 1,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, interval: 1),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: _generateBarGroups(),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children:
              seriesList
                  .map(
                    (series) =>
                        LegendItem(color: series.color, text: series.name),
                  )
                  .toList(),
        ),
      ],
    );
  }

  /// Creates bar groups for the X axis (e.g. each quarter or time point).
  List<BarChartGroupData> _generateBarGroups() {
    final barGroups = <BarChartGroupData>[];

    final maxLength = seriesList.first.values.length;

    for (int i = 0; i < maxLength; i++) {
      final barRods = <BarChartRodData>[];

      for (var series in seriesList) {
        barRods.add(
          BarChartRodData(
            toY: series.values[i],
            color: series.color,
            width: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }

      barGroups.add(BarChartGroupData(x: i, barRods: barRods, barsSpace: 4));
    }

    return barGroups;
  }
}

class _SeriesData {
  final String name;
  final List<double> values;
  final Color color;

  const _SeriesData(this.name, this.values, this.color);
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
