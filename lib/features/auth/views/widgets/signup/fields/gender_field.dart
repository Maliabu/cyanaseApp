import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderField extends ConsumerWidget{
  const GenderField({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(signupFormProvider.select((s) => s.gender));
    final genderError = ref.watch(signupFormProvider.select((s) => s.genderError));
    final notifier = ref.read(signupFormProvider.notifier);

    return DropdownButtonFormField<String>(
        initialValue: gender.isEmpty ? null : gender,
        items: const [
          DropdownMenuItem(value: 'M', child: Text('Male')),
          DropdownMenuItem(value: 'F', child: Text('Female')),
        ],
        onChanged: (val) {
          if (val != null) notifier.setGender(val);
        },
        decoration:  InputDecoration(
          errorText: genderError,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Removes the border
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          filled: true,
          fillColor: Colors.grey[100],
          hintText: 'Select gender',
          prefixIcon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: gender == 'M' ? Icon(Icons.face_6, color: AppThemes.primaryColor,) : Icon(Icons.face_3, color: AppThemes.primaryColor,) ,
          ),
        ),
      );
  }
}