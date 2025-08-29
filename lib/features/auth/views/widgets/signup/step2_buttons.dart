import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2Buttons extends ConsumerWidget {
  const Step2Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signupFormProvider.select((f) => f.email));
    final phoneNumber = ref.watch(signupFormProvider.select((f) => f.phoneNumber));
    final emailError = ref.watch(signupFormProvider.select((f) => f.emailError));
    final phoneError = ref.watch(signupFormProvider.select((f) => f.phoneError));
    final submission = ref.watch(signupFormProvider.select((f) => f.submission));
    final formNotifier = ref.read(signupFormProvider.notifier);
    final api = ApiService();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => formNotifier.previousStep(),
          child: Text('Previous', style: TextStyle(fontSize: 18)),
        ),
        if (emailError == null &&
            phoneError == null &&
            email.isNotEmpty &&
            phoneNumber.length > 8)
          TextButton(
            onPressed: () async {
              final success = await formNotifier.validateUserEmailPhone(api);
              if (success.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success.message!),
                    backgroundColor: Colors.amber,
                  ),
                );
              } else {
                formNotifier.nextStep();
              }
            },
            child: submission?.isLoading ?? false
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text('Next', style: TextStyle(fontSize: 18)),
          ),
      ],
    );
  }
}
