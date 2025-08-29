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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        PasswordField(),
        if (passwordError != null && passwordError!.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            passwordError!,
            style: TextStyle(
              color: Colors.red[700],
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ConfirmPasswordField(),
        const SizedBox(height: 12),
      ],
    );
  }
}