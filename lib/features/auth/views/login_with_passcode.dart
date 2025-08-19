import 'package:cyanaseapp/features/auth/application/login_with_passcode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasscodeLoginScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  PasscodeLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isLoadingProvider);
    final error = ref.watch(errorProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              obscureText: true,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter passcode',
                errorText: error,
              ),
              onChanged: (value) {
                ref.read(passcodeProvider.notifier).state = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  isLoading
                      ? null
                      : () async {
                        final passcode = ref.read(passcodeProvider);
                        ref.read(isLoadingProvider.notifier).state = true;
                        ref.read(errorProvider.notifier).state = null;

                        final success = await authenticate(passcode);

                        ref.read(isLoadingProvider.notifier).state = false;

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login successful!')),
                          );
                          // Navigate to home screen or whatever is next
                        } else {
                          ref.read(errorProvider.notifier).state =
                              'Incorrect passcode';
                        }
                      },
              child:
                  isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
