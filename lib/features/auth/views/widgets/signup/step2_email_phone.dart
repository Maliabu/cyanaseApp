import 'package:country_picker/country_picker.dart';
import 'package:cyanaseapp/core/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';

class Step2EmailPhone extends ConsumerWidget {
  const Step2EmailPhone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupFormProvider);
    final notifier = ref.watch(signupFormProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Contacts', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 25),
          Text('Email', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          TextField(
          onChanged: (value) => notifier.setEmail(value),
          decoration: InputDecoration(
            errorText: state.emailError,
            errorStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderSide: BorderSide.none, // Removes the border
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            filled: true,
            fillColor: Colors.grey[100],
            prefixIcon: const Icon(Icons.mail, color: AppThemes.primaryColor,),
            label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[100], // Background color for label
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Text(
                'email',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey
                ),
              ),
            ),
          ),
        ),
          const SizedBox(height: 12),

          Text('Phone Number', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              errorText: state.phoneError,
              errorStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(
              borderSide: BorderSide.none, // Removes the border
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            filled: true,
            fillColor: Colors.grey[100],
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.countryFlag,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.black,),
                    ],
                  ),
                ),
              ),
              prefixText: '${state.countryCode} ', // e.g. +256
              prefixStyle: const TextStyle(fontSize: 18),
              hintText: state.phoneNumber,
              hintStyle: const TextStyle(fontSize: 18, color: Colors.grey)
            ),
            onChanged: (val) {
              ref.read(signupFormProvider.notifier).setPhoneNumber(val);
            },
          ),
          const SizedBox(height:12),
          Container
          (padding: EdgeInsets.all(16), width: double.infinity, decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppThemes.primaryColor),
            borderRadius: BorderRadius.circular(12),
            color: Colors.amber[50]
          ),
            child: 
            Center(child: 
          Text('Country: ${state.countryName}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}