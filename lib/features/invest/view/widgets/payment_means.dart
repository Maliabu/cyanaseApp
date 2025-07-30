import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step6.dart';
import 'package:cyanaseapp/features/invest/view/widgets/step7.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget paymentMeans(WidgetRef ref) {
  final paymentMeans = ref.watch(investFormProvider).paymentMeans;
  if (paymentMeans == 'offline') {
    return step6Offline(ref);
  } else {
    return step7Online(ref);
  }
}
