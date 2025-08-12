import 'dart:io';

import 'package:cyanaseapp/core/models/investment_class_option.dart';
import 'package:cyanaseapp/core/models/fund_manager.dart';
import 'package:cyanaseapp/core/models/investment_class.dart';

class InvestFormState {
  final int step;
  final FundManager? selectedFundManager;
  final InvestmentClass? selectedInvestmentClass;
  final InvestmentClassOption? selectedInvestmentClassOption;
  final String paymentMeans;
  final String paymentMethod;
  final String depositAmount;

  InvestFormState({
    required this.step,
    this.selectedFundManager,
    this.selectedInvestmentClass,
    this.selectedInvestmentClassOption,
    this.paymentMeans = 'online',
    this.paymentMethod = 'mm',
    this.depositAmount = '',
  });

  InvestFormState copyWith({
    int? step,
    List<dynamic>? fundManagers,
    List<dynamic>? investmentClasses,
    List<dynamic>? classOptions,
    FundManager? selectedFundManager,
    InvestmentClass? selectedInvestmentClass,
    InvestmentClassOption? selectedInvestmentClassOption,
    String? paymentMeans,
    String? paymentMethod,
    String? depositAmount,
  }) {
    return InvestFormState(
      step: step ?? this.step,
      selectedFundManager: selectedFundManager ?? this.selectedFundManager,
      selectedInvestmentClass:
          selectedInvestmentClass ?? this.selectedInvestmentClass,
      selectedInvestmentClassOption:
          selectedInvestmentClassOption ?? this.selectedInvestmentClassOption,
      paymentMeans: paymentMeans ?? this.paymentMeans,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      depositAmount: depositAmount ?? this.depositAmount,
    );
  }

  factory InvestFormState.initial() => InvestFormState(step: 1);

  Map<String, dynamic> toJson() {
    return {
      'fund_manager_id': selectedFundManager?.userId,
      'investment_class_id': selectedInvestmentClass?.classId,
      'investment_option_id': selectedInvestmentClassOption?.classType,
      'payment_means': paymentMeans,
      'payment_method': paymentMethod,
      'deposit_amount': depositAmount,
    };
  }

  // final List<File> attachments;

  // bool get hasAttachments => attachments.isNotEmpty;
}
