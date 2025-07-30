import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';

Widget step7Online(WidgetRef ref) {
  final paymentMeans = ref.watch(investFormProvider).paymentMeans;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Choose your payment means', style: TextStyle(fontSize: 18)),

      RadioListTile<String>(
        title: Text('Offline'),
        value: 'offline',
        groupValue: paymentMeans,
        onChanged: (value) {
          if (value != null) {
            ref.read(investFormProvider.notifier).setPaymentMeans(value);
          }
        },
      ),

      RadioListTile<String>(
        title: Text('Online'),
        value: 'online',
        groupValue: paymentMeans,
        onChanged: (value) {
          if (value != null) {
            ref.read(investFormProvider.notifier).setPaymentMeans(value);
          }
        },
      ),

      SizedBox(height: 12),
    ],
  );
}
