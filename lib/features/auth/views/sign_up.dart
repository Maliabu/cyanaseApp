import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step1_name.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step2_email_phone.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step3_gender_birth.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/step4_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(signupFormProvider);
    final formNotifier = ref.read(signupFormProvider.notifier);
    final api = ApiService();

    Widget stepContent() {
      switch (form.step) {
        case 1:
          return step1Name(ref, context);
        case 2:
          return step2EmailPhone(ref, context);
        case 3:
          return step3GenderBirth(ref, context);
        case 4:
          return step4Password(ref, context);
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          stepContent(),
          if (form.step == 1 && form.firstName.isNotEmpty && form.lastName.isNotEmpty)
          TextButton(
              onPressed: () => formNotifier.nextStep(),
              child: form.submission?.isLoading ?? false
              ?  SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : form.firstNameError == null && form.lastNameError == null 
              ? Text('Next')
              : SizedBox.shrink()
            ),
          if (form.step == 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Previous'),
            ),
            if ((form.emailError == null && form.phoneError == null) &&
            (form.email.isNotEmpty && form.phoneNumber.length > 8))
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
            child: form.submission?.isLoading ?? false
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Next'),
          )
          ],),
          if (form.step == 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Previous'),
            ),
            TextButton(
              onPressed: () => formNotifier.nextStep(),
              child: form.submission?.isLoading ?? false
              ?  SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : (form.genderError == null && form.birthDateError == null ) && (form.gender.isNotEmpty && form.birthDate != null)
              ? Text('Next')
              : SizedBox.shrink()
            ),
          ],),
          if (form.step == 4)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Previous'),
            ),
            TextButton(
              onPressed: ()async{
                final success = await formNotifier.submit(api);
                if(!success.success){
                  // true nope
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success.message),
                    backgroundColor: Colors.amber,
                  ),
                );
                } else {
                   ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success.message),
                    backgroundColor: Colors.amber,
                  ),);
                  Navigator.pushNamed(context, '/');
                }
              },
              child: form.submission?.isLoading ?? false
              ?  SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : (form.passwordError == null && form.confirmPasswordError == null ) && (form.password.isNotEmpty && form.confirmPassword.isNotEmpty)
              ? Text('Submit')
              : SizedBox.shrink()
            ),
          ],)
        ],
      ),
    ),);
  }
}
