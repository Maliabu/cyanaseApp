import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget investmentTimeAreaChart() {
  // Example time-based data (1 point per week)
  final dataPoints = [
    FlSpot(0, 100),
    FlSpot(1, 120),
    FlSpot(2, 130),
    FlSpot(3, 115),
    FlSpot(4, 160),
    FlSpot(5, 190),
    FlSpot(6, 200),
  ];

  final labels = {
    0: 'Aug 1',
    1: 'Aug 8',
    2: 'Aug 15',
    3: 'Aug 22',
    4: 'Aug 29',
    5: 'Sep 5',
    6: 'Sep 12',
  };

  return SizedBox(
    height: 240,
    child: LineChart(
      LineChartData(
        minY: 0,
        gridData: FlGridData(show: true, drawVerticalLine: false),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.shade300),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameSize: 16,
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                return Text(
                  labels[value.toInt()] ?? '',
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                );
              },
              reservedSize: 32,
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget:
                  (value, _) => Text(
                    value.toStringAsFixed(0),
                    style: const TextStyle(fontSize: 10),
                  ),
              interval: 50,
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: dataPoints,
            isCurved: true,
            color: Colors.amber[800],
            belowBarData: BarAreaData(
              show: true,
              color: Colors.amber.withOpacity(0.3),
            ),
            dotData: FlDotData(show: false),
            barWidth: 3,
          ),
        ],
      ),
    ),
  );
}
