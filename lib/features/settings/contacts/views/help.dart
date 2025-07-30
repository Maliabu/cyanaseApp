import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  Widget _contactCard({
    required Widget leading,
    required String title,
    required String subtitle,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading: leading,
        horizontalTitleGap: 28,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _contactCard(
              leading: const Icon(Icons.call_outlined),
              title: 'Call',
              subtitle: '+256 (705) 640 852',
            ),
            _contactCard(
              leading: SvgPicture.asset(
                'assets/images/whatsapp.svg',
                width: 24,
                height: 24,
                placeholderBuilder:
                    (context) => const CircularProgressIndicator(),
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.red),
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              title: 'WhatsApp',
              subtitle: '+256 (705) 640 852',
            ),
            _contactCard(
              leading: const Icon(Icons.mail_outline),
              title: 'Email',
              subtitle: 'support@cyanase.com',
            ),
            _contactCard(
              leading: SvgPicture.asset(
                'assets/images/x.svg',
                width: 24,
                height: 24,
                placeholderBuilder:
                    (context) => const CircularProgressIndicator(),
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.red),
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              title: 'Social Media',
              subtitle: 'Cyanase',
            ),
          ],
        ),
      ),
    );
  }
}
