// features/home/domain/fund_manager.dart
class FundManager {
  final String name;
  final String imageUrl;
  final int gain;
  final int loss;
  final String category;

  FundManager({
    required this.name,
    required this.imageUrl,
    required this.gain,
    required this.loss,
    required this.category,
  });
}

// features/home/domain/portfolio_item.dart
class PortfolioItem {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;

  PortfolioItem({
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
  });
}
