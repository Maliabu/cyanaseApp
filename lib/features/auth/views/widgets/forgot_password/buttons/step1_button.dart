import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1Button extends ConsumerWidget {
  const Step1Button({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(forgotPasswordProvider.select((f) => f.step));
    final email = ref.watch(forgotPasswordProvider.select((f) => f.email));
    final emailError = ref.watch(forgotPasswordProvider.select((f) => f.emailError));
    final submission = ref.watch(forgotPasswordProvider.select((f) => f.submission));
    final formNotifier = ref.read(forgotPasswordProvider.notifier);
    final apiService = ApiService();

    if (step == 1 && email.isNotEmpty && emailError == null){
      return SizedBox.shrink();
    }

    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          TextButton(
          onPressed: () async {
            final success = await formNotifier.validateAndProceedEmail(apiService);

            if (!success.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(success.message!),
                  backgroundColor: Colors.amber,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('A password reset link has been sent to your email'), backgroundColor: Colors.amberAccent,));
            }
          },
          child: submission?.isLoading ?? false
              ? SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Next', style: TextStyle(fontSize: 18),),

        ),]);
  }
}
