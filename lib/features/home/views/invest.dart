import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/invest/view/widgets/payment_means.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Invest extends ConsumerWidget {
  const Invest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(investFormProvider);
    final formNotifier = ref.read(investFormProvider.notifier);

    Widget stepContent() {
      switch (form.step) {
        case 1:
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('KYC - ✅', style: TextStyle(fontSize: 18)),
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
            ],
          );
        case 2:
          return paymentMeans(ref);
        case 3:
          return step5PaymentMeans(ref);
        default:
          return SizedBox.shrink();
      }
    }

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        children: [
          stepContent(),
          if (form.step > 1 && form.step < 6)
            TextButton(
              onPressed: () => formNotifier.previousStep(),
              child: Text('Back'),
            ),
        ],
      ),
    );
  }
}
