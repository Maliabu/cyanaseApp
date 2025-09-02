import 'package:cyanaseapp/core/services/api_service.dart';
import 'package:cyanaseapp/features/auth/application/auth_state_provider.dart';
import 'package:cyanaseapp/features/auth/application/login_with_passcode_provider.dart';
import 'package:cyanaseapp/features/auth/views/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasscodeLoginScreen extends ConsumerWidget {
  const PasscodeLoginScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passcode = ref.watch(passcodeProvider.select((s) => s.passcode));
      final notifier = ref.read(passcodeProvider.notifier);
      final api = ApiService();
      ref.listen(passcodeProvider, (_,state) async {
        if(state.passcode.length == 4){
          // validate and submit
          final success = await notifier.validatePasscode(api);
          if(success.success){
            // successful login
            // call auth + isar
            ref.read(authProvider.notifier).loadOnStartup();
            // confirm cache
            Navigator.pushNamed(context, '/');
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(success.message!),
              backgroundColor: Colors.amber,
            ),
          );
        }
      });

  return Scaffold(appBar: AppBar(title: Text('Login with Passcode'),),
    body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Enter your Passcode', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),),
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
      buildNumPad(ref),
      SizedBox(height: 20,),
      footer(context, false)
      ]
      ),
      ),
    );
  }


  Widget buildNumPad(WidgetRef ref) {
      final notifier = ref.read(passcodeProvider.notifier);

  return Container(
    padding: EdgeInsets.all(20),
    child: GridView.count(
    crossAxisCount: 3,
    shrinkWrap: true,
    children: [
      for (var i = 1; i <= 9; i++)
        buildDigitButton(i.toString(), () => notifier.addDigit(i.toString())),
        SizedBox.shrink(),
        buildDigitButton('0', () => notifier.addDigit('0')),
        buildDigitButton('x', notifier.deleteDigit),
      ],
    )
  );
}

Widget buildDigitButton(String label, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: label == 'x' ? Colors.grey[100]:Colors.grey[200],
        shape: CircleBorder(),
      ),
      child: label != 'x'?
      Text(label, style: TextStyle(fontSize: 24, color: Colors.black))
      : Icon(Icons.backspace_rounded, size: 20, color: Colors.black,)
      ,
    ),
  );
}

}
