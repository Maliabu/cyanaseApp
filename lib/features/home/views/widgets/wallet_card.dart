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
        height: 250,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/back.jpeg'),
          //   fit: BoxFit.cover, // options: cover, contain, fill, etc.
          // ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              const Color.fromARGB(21, 251, 214, 104),
            ],
          ),
          // border: Border.all(width: 1, color: Colors.grey),
          // color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color.fromARGB(
          //       0,
          //       240,
          //       239,
          //       239,
          //     ).withValues(alpha: 2),
          //     blurRadius: 10,
          //     // offset: const Offset(0, 9),
          //   ),
          // ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            // Top Row: Logo or Chip
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Investment made',
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
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
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
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
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// Risk Profile
                _IconWithLabel(
                  icon: Icons.add_chart_outlined,
                  label: 'Risk Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiskProfilePage(),
                      ),
                    );
                  },
                ),

                /// Deposit
                _IconWithLabel(
                  icon: Icons.arrow_outward_sharp,
                  label: 'Invest',
                  size: 12,
                  iconColor: Colors.black,
                  backgroundColor: AppThemes.primaryColor,
                  textColor: Colors.black,
                  onTap: () {
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
                ),

                /// Withdraw
                _IconWithLabel(
                  icon: Icons.download_for_offline_outlined,
                  label: 'Withdraw',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PortfolioPage()),
                    );
                  },
                ),

                /// Portfolio
                _IconWithLabel(
                  icon: Icons.account_circle,
                  label: 'Portfolio',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PortfolioPage()),
                    );
                  },
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

class _IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final double? size;

  const _IconWithLabel({
    required this.icon,
    this.size,
    required this.label,
    required this.onTap,
    this.backgroundColor = const Color.fromARGB(15, 7, 7, 7),
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          radius: 50,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
