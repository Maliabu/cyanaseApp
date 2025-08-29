import 'package:cyanaseapp/core/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

Widget step4Password(WidgetRef ref, BuildContext context) {
  final state = ref.watch(signupFormProvider);
  final notifier = ref.read(signupFormProvider.notifier);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Password', style: TextStyle(fontSize: 14)),
      const SizedBox(height: 8),
      TextField(
        obscureText: !state.isPasswordVisible,
        onChanged: (value) => notifier.setPassword(value),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Removes the border
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.lock, color: AppThemes.primaryColor,),
          suffixIcon: IconButton(
            icon: Icon( color: AppThemes.primaryColor,
              state.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: notifier.togglePasswordVisibility,
          ),
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100], // Background color for label
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
      if (state.passwordError != null && state.passwordError!.isNotEmpty)
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          state.passwordError!,
          style: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
      ),
      const SizedBox(height: 16),
      const Text('Confirm Password', style: TextStyle(fontSize: 14)),
      const SizedBox(height: 8),
      TextField(
        obscureText: !state.isConfirmPasswordVisible,
        onChanged: (value) => notifier.setConfirmPassword(value),
        decoration: InputDecoration(
          errorText: state.confirmPasswordError,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Removes the border
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.lock, color: AppThemes.primaryColor,),
          suffixIcon: IconButton(
            icon: Icon( color: AppThemes.primaryColor,
              state.isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: notifier.toggleConfirmPasswordVisibility,
          ),
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100], // Background color for label
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
    ],
  );
}
