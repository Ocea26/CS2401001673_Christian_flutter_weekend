import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Reminder alerts'),
            subtitle: Text('Customized medication notifications'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Sound preferences'),
            subtitle: Text('Alarm tone and volume'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Profile details'),
            subtitle: Text('User personal information'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
