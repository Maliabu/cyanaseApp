import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final item = index + 1;
        return Row(
          children: [
              Center(
                child: Icon(
                  Icons.rectangle,
                  size: 12,
                    color: item == currentStep
                        ? Colors.amber
                        : Colors.grey[200],
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
              const SizedBox(width: 18),
            ]
          ],
        );
      }),
    );
  }
}
