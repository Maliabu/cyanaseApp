import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/confirm_password_field.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

class Step4Password extends ConsumerWidget {
  const Step4Password({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordError = ref.watch(signupFormProvider.select((s) => s.passwordError));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Create Password', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        
        const Text(
                      'Secure your new account with a strong password and start investing today!',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
        const SizedBox(height: 25),
        PasswordField(),
        if (passwordError != null && passwordError.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            passwordError,
            style: TextStyle(
              color: Colors.red[700],
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ConfirmPasswordField(),
        const SizedBox(height: 20),
      ],
    );
  }
}