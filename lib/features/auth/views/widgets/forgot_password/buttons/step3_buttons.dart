import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3Buttons extends ConsumerWidget {
  const Step3Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(forgotPasswordProvider.select((f) => f.password));
    final confirmPassword = ref.watch(forgotPasswordProvider.select((f) => f.confirmPassword));
    final passwordError = ref.watch(forgotPasswordProvider.select((f) => f.passwordError));
    final confirmPasswordError = ref.watch(forgotPasswordProvider.select((f) => f.confirmPasswordError));
    final submission = ref.watch(forgotPasswordProvider.select((f) => f.submission));
    final formNotifier = ref.read(forgotPasswordProvider.notifier);
    final apiService = ApiService();

    return Padding(padding: EdgeInsetsGeometry.all(20),
    child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Previous', style: TextStyle(fontSize: 18),),
            ),
            if (passwordError == null && confirmPasswordError == null && password.trim() == confirmPassword.trim())
            ElevatedButton(
            onPressed: () async {
              final success = await ref
                  .read(forgotPasswordProvider.notifier)
                  .submit(apiService);
              if (!success.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success.message!),
                    backgroundColor: Colors.amber,
                  ),
                );
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(success.message!), backgroundColor: Colors.amberAccent,));
                Navigator.pushNamed(context, '/');
              }
            },
            child: submission?.isLoading ?? false
              ? SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Submit', style: TextStyle(fontSize: 18),)

        ),
            ],
          )
    );
  }
}
