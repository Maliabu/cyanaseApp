import 'package:cyanaseapp/app/app_bar.dart';
import 'package:cyanaseapp/features/auth/views/widgets/step1_name.dart';
import 'package:cyanaseapp/features/auth/views/widgets/step2_email_phone.dart';
import 'package:cyanaseapp/features/auth/views/widgets/step3_dob.dart';
import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(investFormProvider);
    final formNotifier = ref.read(investFormProvider.notifier);

    Widget stepContent() {
      switch (form.step) {
        case 1:
          return step1Name(ref, context);
        case 2:
          return step2EmailPhone(ref, context);
        case 3:
          return step3GenderBirth(ref, context);
        default:
          return SizedBox.shrink();
      }
    }

    return Scaffold(appBar: AppBar(title: Text('Sign Up'),),
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
          if (form.step > 1 && form.step < 6)
            TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Back'),
            ),
        ],
      ),
    ),);
  }
}
