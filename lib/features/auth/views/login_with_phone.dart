import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/core/widgets/responsive_helper.dart';
import 'package:cyanaseapp/features/auth/application/login_with_phone_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/footer.dart';
import 'package:cyanaseapp/features/auth/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submission = ref.watch(loginFormProvider.select((s)=>s.submission));
    final phoneError = ref.watch(loginFormProvider.select((s)=>s.phoneError));
    final passwordError = ref.watch(loginFormProvider.select((s)=>s.passwordError));
    final isPasswordVisible = ref.watch(loginFormProvider.select((s)=>s.isPasswordVisible));
    final notifier = ref.read(loginFormProvider.notifier);
    print(phoneError);

    return Scaffold(
      body: SafeArea(
        child: 
            Container(
              padding: ResponsiveHelper.responsivePadding(context: context, sm: 20, md: 30, lg: 60),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            header(context),
            Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Enter your details below to securely login to your account.',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        onChanged: (value) => notifier.setPhone(value),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          errorText: phoneError,
                          errorStyle: const TextStyle(fontSize: 14),
                          prefixText: '',
                          prefixIcon: Icon(Icons.call, color: AppThemes.secondaryColor),
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('phone number', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      TextField(
                        obscureText: !isPasswordVisible,
                        onChanged: (value) => notifier.setPassword(value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: AppThemes.secondaryColor),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppThemes.secondaryColor,
                            ),
                            onPressed: notifier.togglePasswordVisibility,
                          ),
                          label: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('Password', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ),
                      if (passwordError != null && passwordError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          passwordError,
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () async {
                                final success = await notifier.validatePhonePassword();
                                if (success.success) {
                                  Navigator.pushNamed(context, '/');
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(success.message!),
                                    backgroundColor: Colors.amber,
                                  ),
                                );
                              },
                        child: submission?.isLoading ?? false
                          ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text('Submit', style: TextStyle(fontSize: 18))
                        ),
                      
                    ],
                  ),
            
            footer(context, true),
          ],
        ),
      ),
    ));
  }
}
