import 'package:cyanaseapp/features/auth/application/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    final submissionState = ref.watch(loginFormProvider);

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
          const Text('Login', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),

          TextField(
            onChanged: (val) {
              ref.read(loginFormProvider);
            },
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed:
                submissionState.submission is AsyncLoading
                    ? null
                    : () async {
                      ref.read(loginFormProvider.notifier);
                    },
            child: submissionState.submission!.maybeWhen(
              loading:
                  () => const CircularProgressIndicator(color: Colors.white),
              orElse: () => const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
