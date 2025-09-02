import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmPasswordField  extends ConsumerWidget{
  //ConfirmPasswordField super constructor
  const ConfirmPasswordField({super.key});

  // override the build from material dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the provider for values and read notifier methods
    final isConfirmPasswordVisible = ref.watch(signupFormProvider.select((s) => s.isConfirmPasswordVisible));
    final confirmPasswordError = ref.watch(signupFormProvider.select((s) => s.confirmPasswordError));
    final notifier = ref.read(signupFormProvider.notifier);

    // must return
    return TextField(
        obscureText: !isConfirmPasswordVisible,
        onChanged: (value) => notifier.setConfirmPassword(value),
        decoration: InputDecoration(
          errorText: confirmPasswordError,
          prefixIcon: const Icon(Icons.lock, color: AppThemes.primaryColor,),
          suffixIcon: IconButton(
            icon: Icon( color: AppThemes.primaryColor,
              isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: notifier.toggleConfirmPasswordVisibility,
          ),
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white, // Background color for label
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
  }
}