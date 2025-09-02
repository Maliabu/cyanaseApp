import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/buttons/step1_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step1_name.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/buttons/step2_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step2_email_phone.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/buttons/step3_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step3_gender_birth.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/buttons/step4_buttons.dart';
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
          return const Step1Name();
        case 2:
          return const Step2EmailPhone();
        case 3:
          return const Step3GenderBirth();
        case 4:
          return const Step4Password();
        default:
          return const SizedBox.shrink();
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // The scrollable, fillable content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: stepContent(),
              ),
            ),

            // Buttons and step indicator pinned to bottom
            const SizedBox(height: 20),

            if (step == 1) const Step1NextButton(),
            if (step == 2) const Step2Buttons(),
            if (step == 3) const Step3Buttons(),
            if (step == 4) const Step4Buttons(),

            const SizedBox(height: 20),

            StepProgressIndicator(currentStep: step, totalSteps: 4),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
