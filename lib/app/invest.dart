import 'package:cyanaseapp/core/providers/fund_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestForm extends StatefulWidget {
  const InvestForm({super.key});

  @override
  State<InvestForm> createState() => _InvestFormState();
}

class _InvestFormState extends State<InvestForm> {
  int currentStep = 1;

  List<dynamic>? fundManagers;
  List<dynamic>? investmentClasses;
  List<dynamic>? classOptions;
  String? className, classLogo, optionName, description, handler, interest;
  double minimum = 0;
  String paymentMeans = 'online';
  String depositAmount = '';

  Widget stepContent() {
    switch (currentStep) {
      case 1:
        return step1FundManagers();
      case 2:
        return step2InvestmentClasses();
      case 3:
        return step3ClassOptions();
      case 4:
        return step4OptionDetails();
      case 5:
        return step5PaymentMeans();
      case 6:
        return step6DepositAmount();
      default:
        return SizedBox.shrink();
    }
  }

  Widget step1FundManagers() {
    return Consumer(
      builder: (context, ref, child) {
        final fundManagersAsync = ref.watch(fundManagerProvider);
        return fundManagersAsync.when(
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
                            title: Text(
                              '${manager.firstName} ${manager.lastName}',
                            ),
                            subtitle: Text(manager.profile.companyCategory),
                            onTap: () {
                              // Do something with manager
                            },
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // call to setRiskProfile(true) or handle risk profile
                    },
                    child: Text('Edit Risk Profile'),
                  ),
                ],
              ),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, _) => Text('Error: $err'),
        );
      },
    );
  }

  Widget step2InvestmentClasses() {
    if (investmentClasses == null) {
      return Center(child: CircularProgressIndicator());
    }
    if (investmentClasses!.isEmpty) {
      return Text(
        'No investment classes available.',
        style: TextStyle(color: Colors.red),
      );
    }
    return Column(
      children:
          investmentClasses!
              .map(
                (cls) => ListTile(
                  leading:
                      cls['logo'] != null
                          ? Image.network(cls['logo'], width: 40, height: 40)
                          : null,
                  title: Text(cls['name']),
                  subtitle: Text(cls['description']),
                  onTap: () {
                    // getClassOptions(cls['name'], cls['description'], cls['id'], cls['logo']);
                  },
                ),
              )
              .toList(),
    );
  }

  Widget step3ClassOptions() {
    if (classOptions == null) return Center(child: CircularProgressIndicator());
    return Column(
      children:
          classOptions!
              .map(
                (opt) => ListTile(
                  title: Text(opt['investment_option']),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // getOptionDetails(opt['investment_option']);
                  },
                ),
              )
              .toList(),
    );
  }

  Widget step4OptionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Invest in $optionName?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text('Description: $description'),
        Text('Handler: $handler'),
        Text('Annual Return: $interest%'),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            setState(() {
              currentStep = 5;
            });
          },
          child: Text('Proceed'),
        ),
      ],
    );
  }

  Widget step5PaymentMeans() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose your payment means', style: TextStyle(fontSize: 18)),
        RadioListTile<String>(
          title: Text('Offline'),
          value: 'offline',
          groupValue: paymentMeans,
          onChanged: (v) => setState(() => paymentMeans = v!),
        ),
        RadioListTile<String>(
          title: Text('Online'),
          value: 'online',
          groupValue: paymentMeans,
          onChanged: (v) => setState(() => paymentMeans = v!),
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            setState(() {
              currentStep = 6;
            });
          },
          child: Text('Continue'),
        ),
      ],
    );
  }

  Widget step6DepositAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            depositAmount = val;
            // Optionally update converted amount using your conversion logic
          },
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            if (double.tryParse(depositAmount) != null) {
              Navigator.pop(context);
              // Continue with submit logic
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please enter a valid amount')),
              );
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            stepContent(),
            if (currentStep > 1 && currentStep < 6)
              TextButton(
                onPressed: () {
                  setState(() {
                    currentStep--;
                  });
                },
                child: Text('Back'),
              ),
          ],
        ),
      ),
    );
  }
}
