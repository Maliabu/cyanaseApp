import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BirthDateField extends ConsumerWidget{
  const BirthDateField({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final birthDateError = ref.watch(signupFormProvider.select((s) => s.birthDateError));
    final birthDate = ref.watch(signupFormProvider.select((s) => s.birthDate));
    final notifier = ref.read(signupFormProvider.notifier);

    
    return InkWell(
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
            errorText: birthDateError,
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
            birthDate != null
                ? DateFormat('yyyy-MM-dd').format(birthDate!)
                : 'Tap to pick date',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
  }
}