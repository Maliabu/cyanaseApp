import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/birth_date_field.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/gender_field.dart';
import 'package:flutter/material.dart';

class Step3GenderBirth extends StatelessWidget {
  const Step3GenderBirth({super.key});

  @override
Widget build(BuildContext context) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text('Personal Information', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const Text(
                      'We would like to know some more information about you...',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
        const SizedBox(height: 25),
      GenderField(),
      const SizedBox(height: 20),
      BirthDateField(),
      SizedBox(height: 20)
    ],
  );
}
}