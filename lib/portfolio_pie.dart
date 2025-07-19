import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PortfolioPie extends StatelessWidget {
  PortfolioPie({super.key});

  // Data series with their names, values, and colors
  final List<_SeriesData> seriesList = [
    _SeriesData('Series 1', [1, 3, 2, 4], Colors.amber[100]!),
    _SeriesData('Series 2', [2, 2.5, 3, 3.5], Colors.amber[300]!),
    _SeriesData('Series 3', [1.5, 2, 2.5, 3], Colors.amber[600]!),
    _SeriesData('Series 4', [3, 2, 1.5, 1], Colors.amber[700]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: _buildPieSections(),
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Legend widget
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

  List<PieChartSectionData> _buildPieSections() {
    return seriesList.map((series) {
      double averageValue =
          series.values.reduce((a, b) => a + b) / series.values.length;
      return PieChartSectionData(
        value: averageValue,
        title: '',
        color: series.color,
        radius: 60,
      );
    }).toList();
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
