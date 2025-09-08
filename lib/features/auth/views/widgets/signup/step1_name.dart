import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/first_name_field.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/last_name_field.dart';
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
          child: Text('Full names', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        const Text(
                      'Enter your first and last name to proceed',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
        const SizedBox(height: 25),
        FirstNameField(),
        const SizedBox(height: 20),
        LastNameField(),
        const SizedBox(height: 20),
      ],
    );
  }
}

