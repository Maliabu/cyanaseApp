import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/invest/domain/invest_form_state.dart';
import 'package:cyanaseapp/features/invest/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget paymentMethod(WidgetRef ref) {
  final paymentMethod = ref.watch(investFormProvider).paymentMethod;
  final step = ref.watch(investFormProvider).step;
  if (paymentMethod == 'mm') {
    return RelworxButton(formState: InvestFormState(step: step));
  } else {
    return FlutterWave(formState: InvestFormState(step: step));
  }
}
