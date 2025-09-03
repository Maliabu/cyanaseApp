import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';

Widget step2Verification(WidgetRef ref, BuildContext context) {
  final formNotifier = ref.watch(forgotPasswordProvider.notifier);
  final email = ref.watch(forgotPasswordProvider.select((s)=>s.email));
  final codeError = ref.watch(forgotPasswordProvider.select((s)=>s.codeError));
  final codeDigits = ref.watch(forgotPasswordProvider.select((s)=>s.codeDigits));

  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  void handleChange(String value, int index) {
    if (value.isNotEmpty) {
      formNotifier.setVerificationCode(index, value);

      if (index < 5) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
      }
    } else {
      formNotifier.setVerificationCode(index, '');
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Enter Verification Code',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.9,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'sent to: $email',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        const SizedBox(height: 25),
        // Input boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            return SizedBox(
              width: 50,
              child: TextField(
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) => handleChange(value, index),
                // Reflect state (e.g. in hot reload or rebuild)
                key: ValueKey(codeDigits[index]),
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: codeDigits[index],
                    selection: TextSelection.collapsed(
                        offset: codeDigits[index].length),
                  ),
                ),
              ),
            );
          }),
        ),

        if (codeError != null)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              codeError,
              style: const TextStyle(color: Colors.red),
            ),
          ),

        const SizedBox(height: 24),
      ],
    ),
  );
}
