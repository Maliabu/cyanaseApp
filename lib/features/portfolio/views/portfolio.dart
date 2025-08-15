import 'package:cyanaseapp/features/goals/views/widgets/goal_chart.dart';
import 'package:cyanaseapp/app/networth.dart';
import 'package:cyanaseapp/features/portfolio/views/portfolio_pie.dart';
import 'package:cyanaseapp/core/models/theme.dart';
import 'package:cyanaseapp/core/models/types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});

  final List<PortfolioColors> colors = [
    PortfolioColors(0, Colors.blue[900]),
    PortfolioColors(1, Colors.black),
    PortfolioColors(2, Colors.amber),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Portfolio', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          0.6, // 60% of screen
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deposit',
                                  style: TextStyle(
                                    color: Colors.yellow[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'You have successfully deposited UGX 40000 to your goal: Start a Ranch of Alpacas.',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Tuesday, 4:30 PM | Jan 12th, 2025',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.timer_outlined),
            style: IconButton.styleFrom(),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.grey[300]!, Colors.grey[50]!, Colors.white],
            ),
          ),
          // color: Colors.grey[200],
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NetworthCard(
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        32,
                        223,
                        222,
                        222,
                      ).withValues(alpha: 2),
                      blurRadius: 7,
                      // offset: const Offset(0, 6),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 12,
                  children: [
                    Text(
                      'Your Investment Activity',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GoalChartPage(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 30,
                  children: [
                    Text(
                      'Investment Summary',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[50],
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              0,
                              240,
                              240,
                              240,
                            ).withValues(alpha: 2),
                            blurRadius: 6,
                            // offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.wallet, color: AppThemes.primaryColor),
                              Text(
                                'Deposits',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Divider(thickness: 0.2),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.download_for_offline,
                                color: AppThemes.primaryColor,
                              ),
                              Text(
                                'Withdraws',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Divider(thickness: 0.2),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // CircleAvatar(
                              //   backgroundColor: Colors.white,
                              //   radius: 10,
                              //   backgroundImage: AssetImage(
                              //     'assets/images/goals.png',
                              //   ),
                              // ),
                              Icon(
                                Icons.ads_click_rounded,
                                color: AppThemes.primaryColor,
                              ),
                              Text(
                                'Goals',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    PortfolioPie(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
