import 'package:cyanaseapp/features/home/views/invest.dart';
import 'package:cyanaseapp/features/home/views/widgets/invest_time_area_chart.dart';
import 'package:cyanaseapp/features/invest/view/invest_form.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InvestmentDetail extends StatelessWidget {
  final String title;
  final String institution;
  final double investedAmount;
  final double currentValue;
  final double returnPercent;
  final double progress;
  final String maturityDate;
  final String riskLevel;

  const InvestmentDetail({
    super.key,
    required this.title,
    required this.institution,
    required this.investedAmount,
    required this.currentValue,
    required this.returnPercent,
    required this.progress,
    required this.maturityDate,
    required this.riskLevel,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = returnPercent >= 0;

    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle(color: Colors.black))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Institution: $institution'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invested:',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'UGX ${investedAmount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Now:',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'UGX ${currentValue.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Return: ${returnPercent.toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 16,
                color: isPositive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 8),
            Text('Maturity Date: $maturityDate'),
            Text('Risk Level: $riskLevel'),
            const SizedBox(height: 16),
            // Add more metrics here as needed
            investmentTimeAreaChart(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Invest(),
                );
              },
            );
          },
          child: const Text('Invest'),
        ),
      ),
    );
  }
}
