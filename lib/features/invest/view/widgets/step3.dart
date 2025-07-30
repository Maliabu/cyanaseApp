import 'package:cyanaseapp/core/providers/investment_class_option_provider.dart';
import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step3ClassOptions(WidgetRef ref, BuildContext context) {
  final investmentClassOptionAsync = ref.watch(investmentClassOptionProvider);
  final selectedInvestmentClass =
      ref.watch(investFormProvider).selectedInvestmentClass;
  return investmentClassOptionAsync.when(
    data:
        (options) => Column(
          children: [
            Text(selectedInvestmentClass?.name ?? ''),
            Text(
              'Select an Investment Class',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Column(
              children:
                  options.map((option) {
                    return ListTile(
                      title: Text(option.name),
                      subtitle: Text(option.description),
                      onTap: () {
                        if (option.name == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'please select an investment option',
                              ),
                            ),
                          );
                          return;
                        }
                        ref
                            .read(investFormProvider.notifier)
                            .selectInvestmentClassoption(option);
                      },
                    );
                  }).toList(),
            ),
          ],
        ),
    loading: () => Center(child: CircularProgressIndicator()),
    error: (err, _) => Text('Error: $err'),
  );
}
