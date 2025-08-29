import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordField  extends ConsumerWidget{
  //passwordfield super constructor
  const PasswordField({super.key});

  // override the build from material dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the provider for values and read notifier methods
    final isPasswordVisible = ref.watch(signupFormProvider.select((s) => s.isPasswordVisible));
    final notifier = ref.read(signupFormProvider.notifier);

    // must return
    return TextField(
        obscureText: !isPasswordVisible,
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
              isPasswordVisible
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
      );
  }
}