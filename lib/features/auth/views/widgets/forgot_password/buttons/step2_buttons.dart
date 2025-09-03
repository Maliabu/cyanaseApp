import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2Buttons extends ConsumerWidget {
  const Step2Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeError = ref.watch(forgotPasswordProvider.select((f) => f.codeError));
    final formNotifier = ref.read(forgotPasswordProvider.notifier);
    final apiService = ApiService();

    return Padding(padding: EdgeInsetsGeometry.all(16),
    child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Previous', style: TextStyle(fontSize: 18),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber
              ),
          onPressed: () async {
            final success = await ref
                .read(forgotPasswordProvider.notifier)
                .validateAndProceedEmail(apiService);
            if (!success.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(success.message!),
                  backgroundColor: Colors.amber,
                ),
              );
            }
            else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('A password reset link has been sent to your email'), backgroundColor: Colors.amberAccent,));
            }
          },
          child: codeError != null
              ? SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Resend Code', style: TextStyle(fontSize: 18),)

        ),
            ],
          )
    );
  }
}
