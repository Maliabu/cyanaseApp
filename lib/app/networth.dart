import 'package:cyanaseapp/core/models/theme.dart';
import 'package:flutter/material.dart';

class NetworthCard extends StatelessWidget {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final VoidCallback? onTap;

  const NetworthCard({
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
        height: 180,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppThemes.primaryColor,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withValues(alpha: 2),
          //     blurRadius: 10,
          //     // offset: const Offset(0, 6),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: Logo or Chip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'total deposit'.toUpperCase(),
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 250, // <- You MUST define width & height
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 32,
                            top: 0,
                            child: Text(
                              "3,080",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'ugx'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 10,
                        color: Color.fromARGB(40, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 10,
                        color: Color.fromARGB(40, 255, 255, 255),
                      ),
                    ),
                    // Icon(Icons.wallet, color: Colors.black),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'total Networth'.toUpperCase(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 250, // <- You MUST define width & height
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 30,
                            top: 0,
                            child: Text(
                              "3,080",
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Text(
                              'ugx'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                Text(
                  '\$ 1.00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: Divider(thickness: 1, color: Colors.black),
                ),
                Text(
                  '\$ 1.00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
