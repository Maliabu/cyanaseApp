import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/step1ResetEmail.dart';
import 'package:cyanaseapp/features/auth/views/widgets/step2NewPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(forgotPasswordProvider);
    final formNotifier = ref.read(forgotPasswordProvider.notifier);
    final apiService = ApiService(); // Or get from Provider if you have one

    Widget stepContent() {
      switch (form.step) {
        case 1:
          return step1ResetEmail(ref, context);
        case 2:
          return step2NewPassword(ref, context);
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
            TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Back'),
            ),
          if (form.step == 1 && form.email.isNotEmpty && form.emailError == null)
  TextButton(
  onPressed: () async {
    final success = await ref
        .read(forgotPasswordProvider.notifier)
        .validateAndProceedEmail(apiService);

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not verify email. Please try again.'),
          backgroundColor: Colors.amber,
        ),
      );
    }
  },
  child: form.submission?.isLoading ?? false 
      ? SizedBox(
          width: 16, height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        )
      : Text('Next'),

),

],
      ),
    ),);
  }
}
