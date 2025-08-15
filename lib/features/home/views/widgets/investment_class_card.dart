import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final String? logo;
  final String institution;
  final double investedAmount;
  final double currentValue;
  final double returnPercent;
  final double progress; // 0.0 to 1.0
  final String maturityDate;
  final String riskLevel;
  final VoidCallback onDetails;
  final VoidCallback onReinvest;
  final VoidCallback onWithdraw;

  const InvestmentCard({
    super.key,
    this.logo,
    required this.title,
    required this.institution,
    required this.investedAmount,
    required this.currentValue,
    required this.returnPercent,
    required this.progress,
    required this.maturityDate,
    required this.riskLevel,
    required this.onDetails,
    required this.onReinvest,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = returnPercent >= 0;

    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .2),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// Right: Maturity Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    maturityDate,
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),

                  /// Risk level tag
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color:
                          riskLevel.toLowerCase() == 'low'
                              ? Colors.green[100]
                              : Colors.orange[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      riskLevel.toLowerCase() == 'low' ? 'L' : 'M',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              // Logo or fallback
              logo != null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      logo!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  )
                  : CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey.shade300,
                    child: Text(
                      title.isNotEmpty ? title[0].toUpperCase() : '?',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

              const SizedBox(width: 8),

              // Institution name
              Flexible(
                child: Text(
                  institution,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔹 Invested, Current, Returns
          Text(
            'Invested: UGX ${investedAmount.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
          Text(
            'Now: UGX ${currentValue.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
          Text(
            'Return: ${returnPercent.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 14,
              color: isPositive ? Colors.amber : Colors.red[600],
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          /// 🔹 Progress bar
          LinearPercentIndicator(
            lineHeight: 8,
            percent: progress.clamp(0.0, 1.0),
            backgroundColor: Colors.grey[300]!,
            progressColor: isPositive ? Colors.amber : Colors.red[400],
            barRadius: const Radius.circular(4),
          ),
          const SizedBox(height: 16),

          /// 🔹 Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _IconAction(
                icon: Icons.info_outline,
                label: 'Details',
                onTap: onDetails,
              ),
              _IconAction(
                icon: Icons.autorenew,
                label: 'Reinvest',
                onTap: onReinvest,
              ),
              _IconAction(
                icon: Icons.download_outlined,
                label: 'Withdraw',
                onTap: onWithdraw,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 🔹 Reusable icon-action button
class _IconAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _IconAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).primaryColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
