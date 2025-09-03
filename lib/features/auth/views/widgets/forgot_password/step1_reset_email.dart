import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step1ResetEmail(WidgetRef ref, BuildContext context) {
  final formNotifier = ref.watch(forgotPasswordProvider.notifier);
  final email = ref.watch(forgotPasswordProvider.select((s)=>s.email));
  final emailError = ref.watch(forgotPasswordProvider.select((s)=>s.emailError));
  return SingleChildScrollView(
    
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child:
        Column(children: [ 
          Text('Reset Email', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.9)),
          Text(email),
          ])),
          const SizedBox(height: 25),
          TextField(
            onChanged: (value) => formNotifier.setEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorText: emailError,
              errorStyle: TextStyle(fontSize: 14),
              prefixIcon: Icon(Icons.mail, color: AppThemes.secondaryColor,),
              label: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white, // Background color for label
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ),
          ),
        const SizedBox(height: 12),

      ],
    ),
  );
}
