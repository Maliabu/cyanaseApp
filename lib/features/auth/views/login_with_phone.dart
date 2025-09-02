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

    return Scaffold(
    body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: header(context)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Enter your details below to securely login to your account.',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 30),

                    TextField(
                      onChanged: notifier.updatePhone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixText: '+256',
                        prefixIcon: Icon(Icons.call, color: AppThemes.primaryColor),
                        label: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text('Phone Number', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    TextField(
                      obscureText: !submissionState.isPasswordVisible,
                      onChanged: notifier.updatePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: AppThemes.primaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            submissionState.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppThemes.primaryColor,
                          ),
                          onPressed: notifier.togglePasswordVisibility,
                        ),
                        label: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text('Password', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: submissionState.submission is AsyncLoading
                            ? null
                            : () async {
                                await notifier.submit();
                              },
                        child: submissionState.submission!.maybeWhen(
                          loading: () => const CircularProgressIndicator(color: Colors.white),
                          orElse: () => const Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
                // FOOTER
                footer(context, true),
              ],
            ),
          );
  }
}