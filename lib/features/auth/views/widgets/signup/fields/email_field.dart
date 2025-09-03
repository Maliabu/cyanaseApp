import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(signupFormProvider.select((s) => s.emailError));
    final notifier = ref.read(signupFormProvider.notifier);
        print("Email rebuilt");


    return TextField(
          onChanged: (value) => notifier.setEmail(value),
          decoration: InputDecoration(
            errorText: error,
            errorStyle: TextStyle(fontSize: 14),
            prefixIcon: const Icon(Icons.mail, color: AppThemes.secondaryColor,),
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white, // Background color for label
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Text(
                'email',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
  }
}
