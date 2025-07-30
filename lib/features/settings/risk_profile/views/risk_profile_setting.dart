import 'package:flutter/material.dart';

class RiskProfileSettingPage extends StatelessWidget {
  const RiskProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take Risk Profile')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          height: 500,
          // margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Row: Logo or Chip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'risk profile'.toUpperCase(),
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Take your Risk Profile Today!',
                          style: TextStyle(
                            fontSize: 23,
                            height: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'This is a questionnaire to be filled by the intending Investor(you).This will help us, help you keep trackOf your investments and help you every step of the way.',
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'This document is a mandatory part of each investor’ s Esteemed investing lifespan. It is mandatory for the good of every investor, to fully complete Your Profile as desired.',
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(children: [Icon(Icons.trending_up_rounded)]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Text(
                      'risk profile status'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'Incomplete Risk Profile',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
