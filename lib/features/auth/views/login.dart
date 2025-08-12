import 'package:cyanaseapp/features/auth/application/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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

          // 📱 Phone input
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // 🔒 Password input
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // 🚀 Submit Button
          ElevatedButton(
            onPressed:
                submissionState is AsyncLoading
                    ? null
                    : () async {
                      await ref
                          .read(loginFormProvider.notifier)
                          .login(
                            _phoneController.text.trim(),
                            _passwordController.text,
                          );
                    },
            child: submissionState.maybeWhen(
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
