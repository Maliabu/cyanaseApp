import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step1Email(WidgetRef ref, BuildContext context) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(
      20,
      20,
      20,
      MediaQuery.of(context).viewInsets.bottom + 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Reset Password', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        Text('Emal', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            prefixText: 'email ',
            prefixIcon: Icon(Icons.account_circle),
            border: OutlineInputBorder(),
          ),
          onChanged: (val) {
            if (val != '0') {
              ref.read(signupFormProvider.notifier).setFirstName(val);
            }
          },
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}
