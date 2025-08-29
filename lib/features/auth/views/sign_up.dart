import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step1_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step1_name.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step2_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step2_email_phone.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step3_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step3_gender_birth.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step4_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step4_password.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
Widget build(BuildContext context, WidgetRef ref) {
  final step = ref.watch(signupFormProvider.select((form) => form.step));
  print('signup rebuilt');

  Widget stepContent() {
    switch (step) {
      case 1:
        return Step1Name();
      case 2:
        return Step2EmailPhone();
      case 3:
        return Step3GenderBirth();
      case 4:
        return Step4Password();
      default:
        return SizedBox.shrink();
    }
  }

  return Scaffold(
    appBar: AppBar(title: Text('Sign Up')),
    body: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
          child: 
              Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: stepContent(),
                    ),
                    if (step == 1) const Step1NextButton(),
                    if (step == 2) const Step2Buttons(),
                    if (step == 3) const Step3Buttons(),
                    if (step == 4) const Step4Buttons(),
                    StepProgressIndicator(currentStep: step),
                  ],
                ),
              ),
              )
          ),
        );
      },
    ),
  );
}

}
