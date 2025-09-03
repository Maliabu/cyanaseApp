import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step4Buttons extends ConsumerWidget {
  const Step4Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(signupFormProvider.select((f) => f.password));
    final confirmPassword = ref.watch(signupFormProvider.select((f) => f.confirmPassword));
    final passwordError = ref.watch(signupFormProvider.select((f) => f.passwordError));
    final confirmPasswordError = ref.watch(signupFormProvider.select((f) => f.confirmPasswordError));
    final submission = ref.watch(signupFormProvider.select((f) => f.submission));
    final formNotifier = ref.read(signupFormProvider.notifier);
    final api = ApiService();

    return Padding(padding: EdgeInsetsGeometry.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => formNotifier.previousStep(),
          child: Text('Previous', style: TextStyle(fontSize: 18)),
        ),
        if (passwordError == null &&
                      confirmPasswordError == null &&
                      password.isNotEmpty &&
                      confirmPassword.isNotEmpty)
        ElevatedButton(
          onPressed: () async {
            final success = await formNotifier.submit(api);
            if (success.success) {
              Navigator.pushNamed(context, '/');
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(success.message),
                backgroundColor: Colors.amber,
              ),
            );
          },
          child: submission?.isLoading ?? false
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Submit', style: TextStyle(fontSize: 18))
        ),
      ],
    )
    );
  }
}
