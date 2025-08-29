import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step1Name(WidgetRef ref, BuildContext context) {
  final state = ref.watch(signupFormProvider);
  final notifier = ref.watch(signupFormProvider.notifier);
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: 
        const Text('Full names', style: TextStyle(fontSize: 18)),),
        const SizedBox(height: 8),
        Text('First Name', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
        onChanged: (value) => notifier.setFirstName(value),
        decoration: InputDecoration(
          errorText: state.firstNameError,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Removes the border
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.person, color: AppThemes.primaryColor,),
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100], // Background color for label
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              'first name',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
        const SizedBox(height: 10),
        Text('Last Name', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
        onChanged: (value) => notifier.setLastName(value),
        decoration: InputDecoration(
          errorText: state.lastNameError,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Removes the border
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.person, color: AppThemes.primaryColor,),
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100], // Background color for label
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              'last name',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 12,)
      ],
    ),
  );
}
