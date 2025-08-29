import 'package:country_picker/country_picker.dart';
import 'package:cyanaseapp/features/auth/application/sign_up_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneField extends ConsumerWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(signupFormProvider.select((s) => s.phoneError));
    final countryFlag = ref.watch(signupFormProvider.select((s)=> s.countryFlag));
    final countryCode = ref.watch(signupFormProvider.select((s)=> s.countryCode));
    final phoneNumber = ref.watch(signupFormProvider.select((s)=> s.phoneNumber));
        print("Phone rebuilt");


    return TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              errorText: error,
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
                        countryFlag,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.black,),
                    ],
                  ),
                ),
              ),
              prefixText: countryCode, // e.g. +256
              prefixStyle: const TextStyle(fontSize: 18),
              hintText: phoneNumber,
              hintStyle: const TextStyle(fontSize: 18, color: Colors.grey)
            ),
            onChanged: (val) {
              ref.read(signupFormProvider.notifier).setPhoneNumber(val);
            },
          );
  }
}
