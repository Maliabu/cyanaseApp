import 'package:cyanaseapp/features/invest/view/invest_form.dart';
import 'package:cyanaseapp/features/portfolio/views/portfolio.dart';
import 'package:cyanaseapp/features/risk_profile/views/risk_profile.dart';
import 'package:cyanaseapp/core/models/theme.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final VoidCallback? onTap;

  const WalletCard({
    super.key,
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/goals.png'),
          //   fit: BoxFit.cover, // options: cover, contain, fill, etc.
          // ),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     const Color.fromARGB(
          //       255,
          //       252,
          //       224,
          //       140,
          //     ), // End color (bottom-left)
          //     const Color.fromARGB(
          //       255,
          //       252,
          //       213,
          //       73,
          //     ), // Start color (top-right)
          //     AppThemes.primaryColor, // Start color (top-right)
          //   ],
          // ),
          // border: Border.all(width: 1, color: Colors.grey),
          color: AppThemes.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
                59,
                240,
                239,
                239,
              ).withValues(alpha: 2),
              blurRadius: 7,
              // offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiskProfilePage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(height: 4),
                      Container(
                        // margin: EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(36, 245, 245, 245),
                          borderRadius: BorderRadius.circular(12),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: const Color.fromARGB(
                          //       19,
                          //       141,
                          //       141,
                          //       141,
                          //     ).withValues(alpha: 2),
                          //     blurRadius: 5,
                          //     // offset: const Offset(0, 6),
                          //   ),
                          // ],
                          // border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Icon(
                          Icons.add_chart_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  'Total Investment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PortfolioPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(height: 4),
                      Container(
                        // margin: EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(27, 245, 245, 245),
                          borderRadius: BorderRadius.circular(16),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: const Color.fromARGB(
                          //       19,
                          //       141,
                          //       141,
                          //       141,
                          //     ).withValues(alpha: 2),
                          //     blurRadius: 5,
                          //     // offset: const Offset(0, 6),
                          //   ),
                          // ],
                          // border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Icon(Icons.account_circle, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Top Row: Logo or Chip
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ugx'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "3,080,000",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // SizedBox(width: 8),
                        // Container(
                        //   padding: EdgeInsets.all(6),
                        //   decoration: BoxDecoration(
                        //     color: const Color.fromARGB(47, 245, 245, 245),
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: Icon(
                        //     Icons.remove_red_eye_outlined,
                        //     size: 16,
                        //     color: Colors.black,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.only(
                  //   top: 4,
                  //   bottom: 4,
                  //   left: 16,
                  //   right: 16,
                  // ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    // color: Color.fromRGBO(255, 255, 255, 0.3),
                  ),
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    // decoration: BoxDecoration(
                    //   color: Color.fromARGB(40, 255, 255, 255),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                    child: Text(
                      '\$ 1.00',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                  width: 50,
                  child: VerticalDivider(
                    thickness: 0.5,
                    width: 0.5,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Networth:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '\$ 1.00',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: InvestForm(),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: AppThemes.secondaryColor,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.wallet, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        'Invest',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PortfolioPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: const Color.fromARGB(64, 245, 245, 245),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.download_for_offline_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8),
                      SizedBox(width: 12),
                      Text(
                        'Withdraw',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: Divider(thickness: 1, color: Colors.black),
            // ),
          ],
        ),
      ),
    );
  }
}
