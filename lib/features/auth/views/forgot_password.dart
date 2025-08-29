import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/step2_verification.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/step1_reset_email.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/step3_new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(forgotPasswordProvider);
    final formNotifier = ref.read(forgotPasswordProvider.notifier);
    final apiService = ApiService();
    ref.listen(forgotPasswordProvider.select((state) => state.codeDigits), (prev, next) async {
      final isCodeComplete = next.every((d) => d.isNotEmpty);
      if (isCodeComplete) {
        ref.read(forgotPasswordProvider.notifier).setLoading(true);
        final fullCode = next.join();
        final success = await ref
          .read(forgotPasswordProvider.notifier)
          .validateAndProceedEmailCode(apiService, fullCode);
        if (!success.success) {
          ref.read(forgotPasswordProvider.notifier).setLoading(false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(success.message!),
              backgroundColor: Colors.amber,
            ),
          );
        }
      }
    });
    
    Widget stepContent() {
      switch (form.step) {
        case 1:
          return step1ResetEmail(ref, context);
        case 2:
          return step2Verification(ref, context);
        case 3:
          return step3NewPassword(ref, context);
        default:
          return SizedBox.shrink();
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Reset Password'),),
    body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        children: [
          stepContent(),
          if (form.step == 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Previous', style: TextStyle(fontSize: 18),),
            ),
            TextButton(
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
          child: form.codeError != null
              ? SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Resend Code', style: TextStyle(fontSize: 18),)

        ),
            ],
          ),
          if(form.step == 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Previous', style: TextStyle(fontSize: 18),),
            ),
            TextButton(
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
          child: form.submission?.isLoading ?? false
              ? SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : (form.password.length > 4 && form.confirmPassword.length > 4) && (form.password.trim() == form.confirmPassword.trim())
              ? Text('Submit', style: TextStyle(fontSize: 18),)
              : SizedBox.shrink()

        ),
            ],
          ),
          if (form.step == 1 && form.email.isNotEmpty && form.emailError == null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          TextButton(
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
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('A password reset link has been sent to your email'), backgroundColor: Colors.amberAccent,));
            }
          },
          child: form.submission?.isLoading ?? false
              ? SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Next', style: TextStyle(fontSize: 18),),

        ),])

],
      ),
    ),);
  }
}
