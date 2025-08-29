import 'package:cyanaseapp/features/auth/views/widgets/signup/first_name_field.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/last_name_field.dart';
import 'package:flutter/material.dart';

class Step1Name extends StatelessWidget {
  const Step1Name({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('signup rebuilt: ${identityHashCode(this)}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text('Full names', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 25),
        const Text('First Name', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 12),
        FirstNameField(),
        const SizedBox(height: 18),
        const Text('Last Name', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 12),
        LastNameField(),
        const SizedBox(height: 12),
      ],
    );
  }
}

