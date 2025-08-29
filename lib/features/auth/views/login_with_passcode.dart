import 'package:cyanaseapp/features/auth/application/login_with_passcode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasscodeLoginScreen extends ConsumerWidget {
  const PasscodeLoginScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passcode = ref.watch(passcodeProvider);

  return Scaffold(appBar: AppBar(title: Text('Login with Passcode'),),
    body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Enter your Passcode', style: TextStyle(fontSize: 14),),
        SizedBox(height: 12,),
      Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(4, (index) {
      final isFilled = index < passcode.length;
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: isFilled ? Colors.black : Colors.transparent,
          border: Border.all(color: Colors.black),
          shape: BoxShape.circle,
          ),
        );
      }),),]),),
    );
  }


  Widget buildNumPad(WidgetRef ref) {
  void addDigit(String digit) {
    final current = ref.read(passcodeProvider);
    if (current.length < 4) {
      ref.read(passcodeProvider.notifier).state += digit;
    }
  }

  void deleteDigit() {
    final current = ref.read(passcodeProvider);
    if (current.isNotEmpty) {
      ref.read(passcodeProvider.notifier).state =
          current.substring(0, current.length - 1);
    }
  }

  return GridView.count(
    crossAxisCount: 3,
    shrinkWrap: true,
    children: [
      for (var i = 1; i <= 9; i++)
        buildDigitButton(i.toString(), () => addDigit(i.toString())),
      buildDigitButton('⌫', deleteDigit),
      buildDigitButton('0', () => addDigit('0')),
      buildDigitButton('OK', () {
        // Trigger login here if passcode is 4 digits
        final entered = ref.read(passcodeProvider);
        if (entered.length == 4) {
          // Proceed with validation
        }
      }),
    ],
  );
}

Widget buildDigitButton(String label, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: Size(60, 60)),
      child: Text(label, style: TextStyle(fontSize: 24)),
    ),
  );
}

}
