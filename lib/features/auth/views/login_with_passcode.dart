import 'package:cyanaseapp/core/widgets/responsive_helper.dart';
import 'package:cyanaseapp/features/auth/application/login_with_passcode_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasscodeLoginScreen extends ConsumerWidget {
  const PasscodeLoginScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passcode = ref.watch(passcodeProvider.select((s) => s.passcode));
    print('kIsWeb: $kIsWeb');

    ref.listen(passcodeProvider.select((s)=>s.snack), (prev, next) {
      if (next != null) {
        // snack has error message
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next)),
          );
      }
    });

    ScreenSize screenSize = ResponsiveHelper.getScreenSize(context);
    double size = 450; //large screens height: so width = h-100
    // Note: Sizes are optimized for mobile (iOS/Android).
// If expanding to tablets or desktop, consider using percentage-based sizing or MediaQuery scale ratios.

    if(screenSize == ScreenSize.sm){
      size = 350;
    } else{
      // md
      size = 400;
    }


  return Scaffold(appBar: AppBar(title: Text('Login with Passcode'),),
    body: SafeArea(
      child: Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Enter your Passcode', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
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
          color: isFilled ? Colors.amber : Colors.grey[200],
          shape: BoxShape.circle,
          ),
        );
      }),),
      SizedBox(height: 20,),
      buildNumPad(context,ref,size),
      footer(context, false)
      ]
      ),
      ),
    )
  );
  }


  Widget buildNumPad(BuildContext context,WidgetRef ref, double size) {
  final notifier = ref.read(passcodeProvider.notifier);

  final digits = [
    '1', '2', '3',
    '4', '5', '6',
    '7', '8', '9',
    '',  '0', 'x'
  ];

  return SizedBox(
    width: size - 100,
    height: size,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: digits.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (_, index) {
          final label = digits[index];
          if (label == '') return SizedBox.shrink();
          if(label == 'x') {
          return ElevatedButton(
            onPressed: () {
                notifier.deleteDigit();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(12),
            ),
            child: Icon(Icons.backspace_rounded, size: 20, color: Colors.black),
          );}
          return OutlinedButton(
            onPressed: () {
              if (label == 'x') {
                notifier.deleteDigit();
              } else {
                notifier.addDigit(label);
              }
            },
            style: OutlinedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(12),
            ),
            child: label != 'x'
                ? Text(label, style: TextStyle(fontSize: ResponsiveHelper.responsiveFontSize(context: context,sm: 25, md: 25, lg: 30), color: Colors.black))
                : Icon(Icons.backspace_rounded, size: 20, color: Colors.black),
          );
        },
      ),
    ),
  );
}
}
