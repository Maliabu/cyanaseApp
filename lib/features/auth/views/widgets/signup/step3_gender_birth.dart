import 'package:cyanaseapp/core/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // For formatting date
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

Widget step3GenderBirth(WidgetRef ref, BuildContext context) {
  final state = ref.watch(signupFormProvider);
  final notifier = ref.read(signupFormProvider.notifier);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Contacts', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
      const Text('Gender', style: TextStyle(fontSize: 14)),
      const SizedBox(height: 8),
      DropdownButtonFormField<String>(
        initialValue: state.gender.isEmpty ? null : state.gender,
        items: const [
          DropdownMenuItem(value: 'M', child: Text('Male')),
          DropdownMenuItem(value: 'F', child: Text('Female')),
        ],
        onChanged: (val) {
          if (val != null) notifier.setGender(val);
        },
        decoration:  InputDecoration(
          errorText: state.genderError,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Removes the border
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          filled: true,
          fillColor: Colors.grey[100],
          hintText: 'Select gender',
          prefixIcon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: state.gender == 'M' ? Icon(Icons.face_6, color: AppThemes.primaryColor,) : Icon(Icons.face_3, color: AppThemes.primaryColor,) ,
          ),
        ),
      ),
      const SizedBox(height: 16),
      const Text('Date of Birth', style: TextStyle(fontSize: 14)),
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
          decoration: InputDecoration(
            errorText: state.birthDateError,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Removes the border
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          filled: true,
          fillColor: Colors.grey[100],
            hintText: 'Select birth date',
            prefixIcon: Icon(Icons.calendar_month, color: AppThemes.primaryColor,)
          ),
          child: Text(
            state.birthDate != null
                ? DateFormat('yyyy-MM-dd').format(state.birthDate!)
                : 'Tap to pick date',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      SizedBox(height: 12,)
    ],
  );
}
