import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step4OptionDetails(WidgetRef ref, BuildContext context) {
  final selectedInvestmentClassOption =
      ref.watch(investFormProvider).selectedInvestmentClassOption;
  var name = selectedInvestmentClassOption?.name;
  var description = selectedInvestmentClassOption?.description;
  var handler = selectedInvestmentClassOption?.handler;
  var interest = selectedInvestmentClassOption?.interest;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Invest in $name?',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text('Description: $description'),
      Text('Handler: $handler'),
      Text('Annual Return: $interest%'),
      SizedBox(height: 12),
    ],
  );
}
