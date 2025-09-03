import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1NextButton extends ConsumerWidget {
  const Step1NextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(signupFormProvider.select((f) => f.firstName));
    final lastName = ref.watch(signupFormProvider.select((f) => f.lastName));
    final firstNameError = ref.watch(signupFormProvider.select((f) => f.firstNameError));
    final lastNameError = ref.watch(signupFormProvider.select((f) => f.lastNameError));
    final submission = ref.watch(signupFormProvider.select((f) => f.submission));
    final formNotifier = ref.read(signupFormProvider.notifier);

    if (firstName.isEmpty || lastName.isEmpty) {
      return SizedBox.shrink();
    }

    return Padding(padding: EdgeInsetsGeometry.all(20),
    child: TextButton(
      onPressed: () => formNotifier.nextStep(),
      child: submission?.isLoading ?? false
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : (firstNameError == null && lastNameError == null)
              ? Text('Next', style: TextStyle(fontSize: 18))
              : SizedBox.shrink(),
    )
    );
  }
}
