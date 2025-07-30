import 'package:flutter/material.dart';

class GoalAd extends StatelessWidget {
  final VoidCallback? onTap;

  const GoalAd({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white, // Add background if needed
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/goals.png', height: 80, width: 80),
              ],
            ),

            const SizedBox(height: 16),

            // Subtitle
            Text(
              'get started'.toUpperCase(),
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),

            const SizedBox(height: 16),

            // Headline
            Text(
              'Whatever your Goal, create them here and let us help you achieve them.',
              style: const TextStyle(
                fontSize: 23,
                height: 1.2,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
            ),

            const Spacer(),

            // Call to Action
            Text(
              'Start now!'.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                height: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
