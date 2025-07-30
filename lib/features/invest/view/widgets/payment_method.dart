import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step6.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step7.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget paymentMethod(WidgetRef ref) {
  final paymentMethod = ref.watch(investFormProvider).paymentMethod;
  if (paymentMethod == 'mm') {
    return relworx(ref);
  } else {
    return flutterwave(ref);
  }
}
