import 'package:cyanaseapp/app/my_home_page.dart';
import 'package:cyanaseapp/faqs.dart';
import 'package:cyanaseapp/help.dart';
import 'package:cyanaseapp/notification_settings.dart';
import 'package:cyanaseapp/notifications.dart';
import 'package:cyanaseapp/profile.dart';
import 'package:cyanaseapp/risk_profile_setting.dart';
import 'package:cyanaseapp/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyanase',
      theme: AppThemes.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Cyanase'),
        '/notifications': (context) => const NotificationPage(),
        '/settings':
            (context) => SettingsList(
              onAccountTap: () => Navigator.pushNamed(context, '/profile'),
              onNotificationsTap:
                  () => Navigator.pushNamed(context, '/notificationsettings'),
              onRiskProfileTap:
                  () => Navigator.pushNamed(context, '/riskprofilesetting'),
              onFaqsTap: () => Navigator.pushNamed(context, '/faqs'),
              onHelpTap: () => Navigator.pushNamed(context, '/help'),
            ),
        '/profile': (context) => const ProfilePage(),
        '/faqs': (context) => const FAQsPage(),
        '/help': (context) => const HelpPage(),
        '/riskprofilesetting': (context) => const RiskProfileSettingPage(),
        '/notificationsettings': (context) => const NotificationSettingsPage(),
      },
    );
  }
}
