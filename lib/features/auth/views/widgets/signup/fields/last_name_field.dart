import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastNameField extends ConsumerWidget {
  const LastNameField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(signupFormProvider.select((s) => s.lastNameError));
    final notifier = ref.read(signupFormProvider.notifier);

    return TextField(
          onChanged: notifier.setLastName,
          decoration: InputDecoration(
            errorText: error,
            errorStyle: const TextStyle(fontSize: 14),
            prefixIcon: const Icon(Icons.person, color: AppThemes.secondaryColor),
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('last name', style: TextStyle(fontSize: 18)),
            ),
          ),
        );
  }
}
