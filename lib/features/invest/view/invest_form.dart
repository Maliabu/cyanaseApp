import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/invest/view/widgets/payment_means.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step1.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step2.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step3.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step4.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestForm extends ConsumerWidget {
  const InvestForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(investFormProvider);
    final formNotifier = ref.read(investFormProvider.notifier);

    Widget stepContent() {
      switch (form.step) {
        case 1:
          return step1FundManagers(ref, context);
        case 2:
          return step2InvestmentClasses(ref, context);
        case 3:
          return step3ClassOptions(ref, context);
        case 4:
          return step4OptionDetails(ref, context);
        case 5:
          return step5PaymentMeans(ref);
        case 6:
          return paymentMeans(ref);
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
