import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/buttons/step1_button.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/buttons/step2_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/buttons/step3_buttons.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/step2_verification.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/step1_reset_email.dart';
import 'package:cyanaseapp/features/auth/views/widgets/forgot_password/step3_new_password.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(forgotPasswordProvider.select((s) => s.step));
    
    // dont risk many listeners on rebuild
    // that equals many async and snacks
    // listen for errorrs in verification code state
    ref.listen(
      forgotPasswordProvider.select((s) => s.codeError),
      (prev, next) {
        // get previous and updated states
        if (next != null) {

          // if the state changed, meaning error has a message
          // show snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next)),
          );
        }
      },
    );

    
    Widget stepContent() {
      switch (step) {
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
    body: Column( 
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child:
        SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            20,
            MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: stepContent(),
          ),),
          const SizedBox(height: 20,),
          if (step == 1) Step1Button(),
          if (step == 2) Step2Buttons(),
          if (step == 3) Step3Buttons(),
          
          const SizedBox(height: 20,),
          StepProgressIndicator(currentStep: step, totalSteps: 3),
          const SizedBox(height: 20,),
        ]
      )
    );
  }
}
