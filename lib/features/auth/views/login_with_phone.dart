import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/login_form_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/footer.dart';
import 'package:cyanaseapp/features/auth/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    final submissionState = ref.watch(loginFormProvider);
    final notifier = ref.watch(loginFormProvider.notifier);

    return Scaffold(body: 
    SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context),
          const SizedBox(height: 16),
          Center(child: 
          const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),),
          const SizedBox(height: 24),

          TextField(
            onChanged: (val) {
              ref.read(loginFormProvider);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixText: '+256',
              border: OutlineInputBorder(
      borderSide: BorderSide.none, // Removes the border
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
              prefixIcon: Icon(Icons.call, color: AppThemes.primaryColor,),
              filled: true,
              fillColor: Colors.grey[100],
              label: Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Background color for label
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Text(
        'Phone Number',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    ),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            obscureText: !submissionState.isPasswordVisible,
            onChanged: notifier.updatePassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Removes the border
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              filled: true,
              fillColor: Colors.grey[100],
              prefixIcon: const Icon(Icons.lock, color: AppThemes.primaryColor,),
              suffixIcon: IconButton(
                icon: Icon( color: AppThemes.primaryColor,
                  submissionState.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: notifier.togglePasswordVisibility,
              ),
              label: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[100], // Background color for label
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

SizedBox(
  width: double.infinity,
  child: 
          ElevatedButton(
            onPressed:
                submissionState.submission is AsyncLoading
                    ? null
                    : () async {
                      ref.read(loginFormProvider.notifier);
                    },
            child: submissionState.submission!.maybeWhen(
              loading:
                  () => const CircularProgressIndicator(color: Colors.white),
              orElse: () => const Text('Login'),
            ),
          ),),
          footer(context)
        ],
      ),
    ),);
  }
}
