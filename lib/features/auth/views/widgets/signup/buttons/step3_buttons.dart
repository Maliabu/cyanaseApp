import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3Buttons extends ConsumerWidget {
  const Step3Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(signupFormProvider.select((f) => f.gender));
    final birthDate = ref.watch(signupFormProvider.select((f) => f.birthDate));
    final genderError = ref.watch(signupFormProvider.select((f) => f.genderError));
    final birthDateError = ref.watch(signupFormProvider.select((f) => f.birthDateError));
    final submission = ref.watch(signupFormProvider.select((f) => f.submission));
    final formNotifier = ref.read(signupFormProvider.notifier);

    return Padding(padding: EdgeInsetsGeometry.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => formNotifier.previousStep(),
          child: Text('Previous', style: TextStyle(fontSize: 18)),
        ),
        TextButton(
          onPressed: () => formNotifier.nextStep(),
          child: submission?.isLoading ?? false
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : (genderError == null &&
                      birthDateError == null &&
                      gender.isNotEmpty &&
                      birthDate != null)
                  ? Text('Next', style: TextStyle(fontSize: 18))
                  : SizedBox.shrink(),
        ),
      ],
    )
    );
  }
}
