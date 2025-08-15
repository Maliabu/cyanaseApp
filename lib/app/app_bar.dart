import 'package:cyanaseapp/app/notifications.dart';
import 'package:cyanaseapp/features/settings/profile/views/profile.dart';
import 'package:cyanaseapp/features/settings/views/settings.dart';
import 'package:cyanaseapp/core/models/theme.dart';
import 'package:flutter/material.dart';

enum MenuOption { settings, profile }

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Hi Patricia',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/night.jpeg'),
              ),
            ),
          );
        },
      ),
      actions: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              tooltip: 'Notifications',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
            ),
            Positioned(
              right: 4,
              top: 4,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppThemes.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: const Text(
                  '3', // Replace with dynamic value
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.settings),

          tooltip: 'Settings',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SettingsList(
                      onAccountTap:
                          () => Navigator.pushNamed(context, '/profile'),
                      onNotificationsTap:
                          () => Navigator.pushNamed(
                            context,
                            '/notificationsettings',
                          ),
                      onRiskProfileTap:
                          () => Navigator.pushNamed(
                            context,
                            '/riskprofilesetting',
                          ),
                      onFaqsTap: () => Navigator.pushNamed(context, '/faqs'),
                      onHelpTap: () => Navigator.pushNamed(context, '/help'),
                    ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
