// features/home/data/home_service.dart

import 'package:cyanaseapp/core/models/fund_manager.dart';

class HomeService {
  Future<List<PortfolioItem>> fetchPortfolio() async {
    await Future.delayed(Duration(seconds: 1)); // simulate network delay
    return [
      PortfolioItem(
        cardHolder: 'John Doe',
        cardNumber: '**** **** **** 1234',
        expiryDate: '12/26',
      ),
      // add more dummy cards if you want
    ];
  }

  Future<List<FundManager>> fetchFundManagers() async {
    await Future.delayed(Duration(seconds: 1));
    return List.generate(
      10,
      (index) => FundManager(
        name: 'OAC Venture Capital $index',
        imageUrl: 'assets/images/night.jpeg',
        gain: 3500,
        loss: 5400,
        category: 'Venture capital',
      ),
    );
  }
}
