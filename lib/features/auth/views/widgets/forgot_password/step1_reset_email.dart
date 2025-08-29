import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/features/auth/application/forgot_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step1ResetEmail(WidgetRef ref, BuildContext context) {
  final formNotifier = ref.watch(forgotPasswordProvider.notifier);
  final form = ref.watch(forgotPasswordProvider);
  return SingleChildScrollView(
    
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child:
        Column(children: [ 
          Text('Reset Email', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.9)),
          Text(form.email),
          ])),
          const SizedBox(height: 18),
          TextField(
            onChanged: (value) => formNotifier.setEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorText: form.emailError,
              errorStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide.none, // Removes the border
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              prefixIcon: Icon(Icons.mail, color: AppThemes.primaryColor,),
              filled: true,
              fillColor: Colors.grey[100],
              label: Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Background color for label
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
        const SizedBox(height: 10),

      ],
    ),
  );
}
