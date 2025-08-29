import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final item = index + 1;
        return Row(
          children: [
            Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: item == currentStep
                    ? Colors.amber[50]
                    : Colors.grey[100],
              ),
              child: Center(
                child: Text(
                  item.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: item == currentStep
                        ? Colors.amber
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            if (item < totalSteps) ...[
              const SizedBox(width: 8),
              const SizedBox(
                width: 20,
                child: Divider(
                  height: 12,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
            ]
          ],
        );
      }),
    );
  }
}
