import 'dart:ui';

import 'package:flutter/src/material/colors.dart';

class ConversionResult {
  final double amount;
  final String? error;

  ConversionResult({required this.amount, this.error});
}

class InvestmentOption {
  final String label;
  final String value;

  InvestmentOption({required this.label, required this.value});
}

class GetCurrencyResult {
  final String currency;
  final String? error;

  GetCurrencyResult({required this.currency, this.error});
}

class PortfolioColors {
  final int index;
  final Color? color;

  PortfolioColors(this.index, this.color);
}
