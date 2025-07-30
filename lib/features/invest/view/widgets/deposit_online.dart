import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/invest/view/widgets/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget depositOnline(WidgetRef ref) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'How much would you like to deposit?',
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 8),
      TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixText: 'UGX ',
          border: OutlineInputBorder(),
        ),
        onChanged: (val) {
          if (val != '0') {
            ref.read(investFormProvider.notifier).setDepositAmount(val);
          }
        },
      ),
      SizedBox(height: 12),
      ElevatedButton(
        onPressed: () {
          paymentMethod(ref);
        },
        child: Text('Submit'),
      ),
    ],
  );
}
