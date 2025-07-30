import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  // AUTOSAVE SETTINGS
  bool autosaveEnabled = true;
  bool autosaveReminders = false;

  // GOAL NOTIFICATIONS
  bool goalProgress = true;
  bool goalDeadlineAlerts = true;

  // APP UPDATES
  bool appUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        leading: const BackButton(),
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔹 AUTOSAVE CARD
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Autosave",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SwitchListTile(
                      title: const Text("Enable Autosave"),
                      value: autosaveEnabled,
                      onChanged: (val) => setState(() => autosaveEnabled = val),
                    ),
                    SwitchListTile(
                      title: const Text("Reminders before autosave"),
                      value: autosaveReminders,
                      onChanged:
                          (val) => setState(() => autosaveReminders = val),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),

            /// 🔹 GOAL CARD
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Goal Notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SwitchListTile(
                      title: const Text("Progress Updates"),
                      value: goalProgress,
                      onChanged: (val) => setState(() => goalProgress = val),
                    ),
                    SwitchListTile(
                      title: const Text("Deadline Reminders"),
                      value: goalDeadlineAlerts,
                      onChanged:
                          (val) => setState(() => goalDeadlineAlerts = val),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),

            /// 🔹 UPDATES CARD
            Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "App Updates",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SwitchListTile(
                      title: const Text("Notify me about new features"),
                      value: appUpdates,
                      onChanged: (val) => setState(() => appUpdates = val),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
