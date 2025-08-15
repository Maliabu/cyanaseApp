class InvestmentModel {
  final String title;
  final String institution;
  final double investedAmount;
  final double currentValue;
  final double returnPercent;
  final double progress;
  final String? logo;
  final String maturityDate;
  final String riskLevel;

  InvestmentModel({
    required this.title,
    required this.institution,
    required this.investedAmount,
    required this.currentValue,
    this.logo,
    required this.returnPercent,
    required this.progress,
    required this.maturityDate,
    required this.riskLevel,
  });
}
