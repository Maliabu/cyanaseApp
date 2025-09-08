import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/email_field.dart';
import 'package:cyanaseapp/features/auth/views/widgets/signup/fields/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

class Step2EmailPhone extends ConsumerWidget {
  const Step2EmailPhone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // always watch the field you need not the whole form state
    // to avoid unecessary ui rebuild
    final countryName = ref.watch(signupFormProvider.select((s) => s.countryName));

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Contacts', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const Text(
                      'Enter your full email address and phone number below.',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
          const SizedBox(height: 25),
          EmailField(),
          const SizedBox(height: 20),
          PhoneField(),
          const SizedBox(height:20),
          Container
          (padding: EdgeInsets.all(16), width: double.infinity, decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppThemes.primaryColor),
            borderRadius: BorderRadius.circular(12),
            color: Colors.amber[50]
          ),
            child: 
            Center(child: 
          Text('Country: $countryName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}