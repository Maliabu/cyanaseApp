import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

Widget step2EmailPhone(WidgetRef ref, BuildContext context) {
  final formState = ref.watch(signupFormProvider);

  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(
      20,
      20,
      20,
      MediaQuery.of(context).viewInsets.bottom + 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Login', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),

        Text('Email', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(),
          ),
          onChanged:
              (val) => ref.read(signupFormProvider.notifier).setEmail(val),
        ),
        const SizedBox(height: 10),

        Text('Phone Number', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    ref.read(signupFormProvider.notifier).setCountry(country);
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formState.countryCode,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            hintText: 'Enter phone number',
            border: const OutlineInputBorder(),
          ),
          onChanged:
              (val) =>
                  ref.read(signupFormProvider.notifier).setPhoneNumber(val),
        ),

        const SizedBox(height: 8),
        Text('Selected Country: ${formState.countryName}'),
      ],
    ),
  );
}
