import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  final VoidCallback onAccountTap;
  final VoidCallback onNotificationsTap;
  final VoidCallback onFaqsTap;
  final VoidCallback onHelpTap;
  final VoidCallback onRiskProfileTap;

  const SettingsList({
    super.key,
    required this.onAccountTap,
    required this.onNotificationsTap,
    required this.onFaqsTap,
    required this.onHelpTap,
    required this.onRiskProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.grey[50],
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Profile Row
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/night.jpeg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Patricia Giramia',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.05,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Personal Account',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // 🔹 Settings List
            Expanded(
              child: ListView(
                children: [
                  settingsItem(
                    icon: Icons.account_circle_outlined,
                    title: 'Account',
                    subtitle: 'Profile, Next of Kin, Security, Privacy',
                    onTap: onAccountTap,
                  ),
                  settingsItem(
                    icon: Icons.notifications_none_outlined,
                    title: 'Notifications',
                    subtitle: 'On Goals, Deposits',
                    onTap: onNotificationsTap,
                  ),
                  settingsItem(
                    icon: Icons.insert_chart_outlined_outlined,
                    title: 'Risk Profile',
                    subtitle: 'Risk Analysis',
                    onTap: onRiskProfileTap,
                  ),
                  settingsItem(
                    icon: Icons.chat_outlined,
                    title: 'FAQs',
                    subtitle: 'Learn More About Cyanase',
                    onTap: onFaqsTap,
                  ),
                  settingsItem(
                    icon: Icons.call_outlined,
                    title: 'Help Centre',
                    subtitle: 'Call, Whatsapp, Emails',
                    onTap: onHelpTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable settings item builder
  Widget settingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        horizontalTitleGap: 28,
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
