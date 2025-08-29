import 'package:cyanaseapp/features/auth/views/widgets/signup/birth_date_field.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/gender_field.dart';
import 'package:flutter/material.dart';

class Step3GenderBirth extends StatelessWidget {
  const Step3GenderBirth({super.key});

  @override
Widget build(BuildContext context) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Contacts', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
      const Text('Gender', style: TextStyle(fontSize: 14)),
      const SizedBox(height: 8),
      GenderField(),
      const SizedBox(height: 16),
      const Text('Date of Birth', style: TextStyle(fontSize: 14)),
      const SizedBox(height: 8),
      BirthDateField(),
      SizedBox(height: 12,)
    ],
  );
}
}