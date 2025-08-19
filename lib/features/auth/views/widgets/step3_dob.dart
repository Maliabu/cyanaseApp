import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // For formatting date
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

Widget step3GenderBirth(WidgetRef ref, BuildContext context) {
  final state = ref.watch(signupFormProvider);
  final notifier = ref.read(signupFormProvider.notifier);

  return Padding(
    padding: EdgeInsets.fromLTRB(
      20,
      20,
      20,
      MediaQuery.of(context).viewInsets.bottom + 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: state.gender.isEmpty ? null : state.gender,
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
          ],
          onChanged: (val) {
            if (val != null) notifier.setGender(val);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Select gender',
          ),
        ),
        const SizedBox(height: 16),

        const Text('Date of Birth', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              notifier.setBirthDate(picked);
            }
          },
          child: InputDecorator(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select birth date',
            ),
            child: Text(
              state.birthDate != null
                  ? DateFormat('yyyy-MM-dd').format(state.birthDate!)
                  : 'Tap to pick date',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    ),
  );
}
