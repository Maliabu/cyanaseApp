import 'package:cyanaseapp/core/providers/investment_class_provider.dart';
import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step2InvestmentClasses(WidgetRef ref, BuildContext context) {
  final investmentClassAsync = ref.watch(investmentClassProvider);
  final selectedFundManager = ref.watch(investFormProvider).selectedFundManager;

  return investmentClassAsync.when(
    data:
        (investmentClass) => Column(
          children: [
            Text(
              selectedFundManager?.firstName ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Select an Investment Class',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              children:
                  investmentClass.map((iClass) {
                    return ListTile(
                      leading: Image.network(
                        iClass.name,
                        width: 40,
                        height: 40,
                      ),
                      title: Text(iClass.name),
                      subtitle: Text(iClass.description),
                      onTap: () {
                        if (iClass.classId <= 0) {
                          // all ids start at 1
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please select an investment class",
                              ),
                            ),
                          );
                          return;
                        }
                        // Do something with manager
                        ref
                            .read(investFormProvider.notifier)
                            .selectInvestmentClass(iClass);

                        // getClassOptions(cls['name'], cls['description'], cls['id'], cls['logo']);
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
