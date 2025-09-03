import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step3NewPassword(WidgetRef ref, BuildContext context) {
  final passwordError = ref.watch(forgotPasswordProvider.select((s) => s.passwordError));
  final confirmPasswordError = ref.watch(forgotPasswordProvider.select((s) => s.confirmPasswordError));
  final isPasswordVisible = ref.watch(forgotPasswordProvider.select((s) => s.isPasswordVisible));
  final isConfirmPasswordVisible = ref.watch(forgotPasswordProvider.select((s) => s.isConfirmPasswordVisible));
  final notifier = ref.read(forgotPasswordProvider.notifier);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
          Text('Create a password', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.9)),
          const Text(
                      'Secure your new account with a strong password and start investing today!',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
          const SizedBox(height: 25),
      TextField(
        obscureText: !isPasswordVisible,
        onChanged: (value) => notifier.setPassword(value),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: AppThemes.secondaryColor,),
          suffixIcon: IconButton(
            icon: Icon( color: AppThemes.secondaryColor,
              isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: notifier.togglePasswordVisibility,
          ),
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white, // Background color for label
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      if (passwordError != null && passwordError.isNotEmpty)
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          passwordError,
          style: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
      ),
      const SizedBox(height: 20),
      TextField(
        obscureText: !isConfirmPasswordVisible,
        onChanged: (value) => notifier.setConfirmPassword(value),
        decoration: InputDecoration(
          errorText: confirmPasswordError,
          prefixIcon: const Icon(Icons.lock, color: AppThemes.secondaryColor,),
          suffixIcon: IconButton(
            icon: Icon( color: AppThemes.secondaryColor,
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
      ),
      const SizedBox(height: 20),
    ],
  );
}
