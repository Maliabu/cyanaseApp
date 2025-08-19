import 'package:cyanaseapp/core/widgets/scroll_wallpaper.dart';
import 'package:cyanaseapp/features/home/models/investment_model.dart';
import 'package:cyanaseapp/features/home/views/widgets/investment_class_card.dart';
import 'package:cyanaseapp/features/home/views/widgets/investment_option_card.dart';
import 'package:cyanaseapp/features/home/views/widgets/wallet_card.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> investmentClasses = [
      {
        'name': 'Treasury Bills',
        'color': Colors.amber[700],
        'icon': Icons.attach_money_rounded,
      },
      {
        'name': 'Treasury Bonds',
        'color': Colors.blue[900],
        'icon': Icons.receipt_long,
      },
      {
        'name': 'Venture Capital',
        'color': Colors.teal[900],
        'icon': Icons.business_center,
      },
      {
        'name': 'Cash',
        'color': Colors.blueGrey[900],
        'icon': Icons.attach_money,
      },
    ];
    final List<Map<String, String>> fundManagers = [
      {
        'name': 'caritas',
        'imageUrl':
            'https://i.pinimg.com/736x/64/d8/ab/64d8ab334211899755be73c92a7c9d27.jpg',
      },
      {
        'name': 'ortus',
        'imageUrl':
            'https://i.tracxn.com/logo/company/ortusafricacapital.com_Logo_fe614c60-e65c-414b-9456-8af60802ac13.jpg',
      },
      {
        'name': 'sanlam',
        'imageUrl':
            'https://play-lh.googleusercontent.com/4bhlbKG_ynCOE6Ju1PAI0yeSW7zp8DRLQdFBI8F25ccaPmOypVjIDbo3PG1TASIK8cc',
      },
      {
        'name': 'mtn',
        'imageUrl':
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/New-mtn-logo.jpg/960px-New-mtn-logo.jpg?20220217143058=',
      },
      // Add more if needed
    ];

    final investments = [
      InvestmentModel(
        title: 'Treasury Bills',
        institution: 'Bank of Uganda',
        investedAmount: 5000000,
        currentValue: 5350000,
        returnPercent: 7.0,
        progress: 0.65,
        maturityDate: 'Oct 12, 2025',
        riskLevel: 'Low',
        logo:
            'https://nssfug.kanzucode.com/wp-content/uploads/2020/08/bou-1024x972.jpg',
      ),
      InvestmentModel(
        title: 'Bills',
        institution: 'MTN Uganda',
        investedAmount: 3000000,
        currentValue: 3150000,
        returnPercent: 5.0,
        progress: 0.40,
        maturityDate: 'Dec 01, 2025',
        riskLevel: 'Medium',
        logo:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/New-mtn-logo.jpg/960px-New-mtn-logo.jpg?20220217143058=',
      ),
      InvestmentModel(
        title: 'Corporate Bonds',
        institution: 'Bank of Uganda',
        investedAmount: 5000000,
        currentValue: 5350000,
        returnPercent: 7.0,
        progress: 0.65,
        maturityDate: 'Oct 12, 2025',
        riskLevel: 'Low',
        logo:
            'https://nssfug.kanzucode.com/wp-content/uploads/2020/08/bou-1024x972.jpg',
      ),
    ];
    final bonds = [
      InvestmentModel(
        title: 'Corporate Bonds',
        institution: 'Bank of Uganda',
        investedAmount: 5000000,
        currentValue: 5350000,
        returnPercent: 7.0,
        progress: 0.65,
        maturityDate: 'Oct 12, 2025',
        riskLevel: 'Low',
        logo:
            'https://nssfug.kanzucode.com/wp-content/uploads/2020/08/bou-1024x972.jpg',
      ),
    ];

    return ScrollablePage(
      child: Column(
        children: [
          WalletCard(
            cardHolder: 'John Doe',
            cardNumber: '**** **** **** 1234',
            expiryDate: '12/26',
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
          ),
          Container(
            height: 220,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -40,
                  left: 30,
                  right: 0,
                  child: SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: investments.length,
                      itemBuilder: (context, index) {
                        final inv = investments[index];
                        return InvestmentCard(
                          title: inv.title,
                          logo: inv.logo,
                          institution: inv.institution,
                          investedAmount: inv.investedAmount,
                          currentValue: inv.currentValue,
                          returnPercent: inv.returnPercent,
                          progress: inv.progress,
                          maturityDate: inv.maturityDate,
                          riskLevel: inv.riskLevel,
                          onDetails: () {
                            /* navigate or show modal */
                          },
                          onReinvest: () {
                            /* reinvest action */
                          },
                          onWithdraw: () {
                            /* withdraw action */
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          // InvestmentClass(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Investment Classes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: investmentClasses.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final item = investmentClasses[index];
                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: item['color'],
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/dark.jpeg'),
                    //   fit: BoxFit.cover, // options: cover, contain, fill, etc.
                    // ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(114, 36, 36, 36),
                        radius: 35,
                        child: Icon(
                          item['icon'],
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12),
          // InvestmentClass(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Our Recomendations & Rating: *****',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(2),

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: investments.length, // replace with your list
              itemBuilder: (context, index) {
                final inv = investments[index];
                return InvestmentOptionCard(
                  title: inv.title,
                  logo: inv.logo,
                  institution: inv.institution,
                  investedAmount: inv.investedAmount,
                  currentValue: inv.currentValue,
                  returnPercent: inv.returnPercent,
                  progress: inv.progress,
                  maturityDate: inv.maturityDate,
                  riskLevel: inv.riskLevel,
                  onDetails: () {
                    /* navigate or show modal */
                  },
                  onReinvest: () {
                    /* reinvest action */
                  },
                  onWithdraw: () {
                    /* withdraw action */
                  },
                );
              },
            ),
          ),
          SizedBox(height: 12),
          // InvestmentClass(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Fund Managers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: fundManagers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final item = fundManagers[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item['imageUrl'] ?? 'https://via.placeholder.com/48',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
