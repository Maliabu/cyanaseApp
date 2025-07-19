import 'package:cyanaseapp/theme.dart';
import 'package:cyanaseapp/types.dart';
import 'package:flutter/material.dart';

class InvestmentQuestionStep extends StatelessWidget {
  final String questionText;
  final String questionNumber;
  final Widget? table;
  final List<InvestmentOption> options;
  final Map<String, bool> currentSelections;
  final void Function(String questionName, String value, bool checked)
  onChanged;
  final int step;
  final double progressPercentage;

  const InvestmentQuestionStep({
    super.key,
    required this.questionText,
    required this.questionNumber,
    required this.options,
    required this.currentSelections,
    required this.onChanged,
    required this.step,
    required this.progressPercentage,
    this.table,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (table != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: table!,
                ),
              ),

            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                questionText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppThemes.lightTheme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children:
                    options.map((option) {
                      return CheckboxListTile(
                        title: Text(
                          option.label,
                          style: TextStyle(color: Colors.white),
                        ),
                        value: currentSelections[option.value] ?? false,
                        onChanged: (bool? checked) {
                          onChanged(
                            questionNumber,
                            option.value,
                            checked ?? false,
                          );
                        },
                        side: BorderSide(color: Colors.white),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Progress: $progressPercentage %"),
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: progressPercentage / 100,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.amber,
                    minHeight: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
