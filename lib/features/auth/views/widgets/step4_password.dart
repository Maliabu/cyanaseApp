import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

Widget step4Password(WidgetRef ref, BuildContext context) {
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
        const Text('Password', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        TextField(
          obscureText: !state.isPasswordVisible,
          onChanged: notifier.setPassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(),
            hintText: 'Enter password',
            suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: notifier.togglePasswordVisibility,
            ),
          ),
        ),
        const SizedBox(height: 16),

        const Text('Confirm Password', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        TextField(
          obscureText: !state.isConfirmPasswordVisible,
          onChanged: notifier.setConfirmPassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline),
            border: const OutlineInputBorder(),
            hintText: 'Repeat password',
            suffixIcon: IconButton(
              icon: Icon(
                state.isConfirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: notifier.toggleConfirmPasswordVisibility,
            ),
          ),
        ),
      ],
    ),
  );
}
