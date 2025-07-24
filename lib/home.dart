import 'package:cyanaseapp/chat_ad.dart';
import 'package:cyanaseapp/features/home/presentation/widgets/wallet_card.dart';
import 'package:cyanaseapp/goals.dart';
import 'package:cyanaseapp/risk_profile_ad.dart';
import 'package:cyanaseapp/scrollWallpaper.dart';
import 'package:cyanaseapp/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      child: Column(
        children: [
          WalletCard(
            cardHolder: 'John Doe',
            cardNumber: '**** **** **** 1234',
            expiryDate: '12/26',
            onTap: () {
              print('Card selected');
            },
          ),
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
                Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Investment Classes',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.grey[200],
            height: 200,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.all(2),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    // border: Border.all(width: 1, color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          36,
                          232,
                          231,
                          231,
                        ).withValues(alpha: 2),
                        blurRadius: 5,
                        // offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/night.jpeg'),
                      ),
                      Text(
                        'OAC Venture Capital $index',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '+ 3,500',
                            style: const TextStyle(
                              color: AppThemes.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '5,400 -',
                            style: TextStyle(
                              color: Colors.red[900],
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Venture capital',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'My Goals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      spacing: 2,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            '54.14%',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoalsPage(show: true),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Go To Goals',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ChatAd(
            onTap: () {
              print('Card selected');
            },
          ),
          RiskProfileAd(
            onTap: () {
              print('r profile selected');
            },
          ),
        ],
      ),
    );
  }
}
