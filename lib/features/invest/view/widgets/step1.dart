import 'package:cyanaseapp/core/providers/fund_manager_provider.dart';
import 'package:cyanaseapp/features/invest/application/invest_form_provider.dart';
import 'package:cyanaseapp/features/risk_profile/views/risk_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget step1FundManagers(WidgetRef ref, BuildContext context) {
  final fundManagersAsync = ref.watch(fundManagerProvider);
  return fundManagersAsync.when(
    // build starts
    // no side-effects here (snacks and dialogs), only on gesture
    data:
        (fundManagers) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Fund Manager',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              children:
                  fundManagers.map((manager) {
                    return ListTile(
                      title: Text('${manager.firstName} ${manager.lastName}'),
                      subtitle: Text(manager.profile.country),
                      onTap: () {
                        if (manager.userId <= 0) {
                          // all ids start at 1
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please select a manager")),
                          );
                          return;
                        }
                        // Do something with manager
                        ref
                            .read(investFormProvider.notifier)
                            .selectFundManager(manager);
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // call to setRiskProfile(true) or handle risk profile
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RiskProfilePage()),
                );
              },
              child: Text('Edit Risk Profile'),
            ),
          ],
        ),
    loading: () => Center(child: CircularProgressIndicator()),
    error: (err, _) => Text('Error: $err'),
  );
}
