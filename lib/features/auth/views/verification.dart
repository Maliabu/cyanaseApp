import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/verification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Verification extends ConsumerWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationAsync = ref.watch(verificationProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 70,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Verify Email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppThemes.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Please enter the 6-digit code sent to ',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextSpan(
                      text: '',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            AppThemes
                                .primaryColor, // Change the color of the email
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: AppThemes.primaryColor,
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend Email Code',
                  style: TextStyle(fontSize: 16, color: AppThemes.primaryColor),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
