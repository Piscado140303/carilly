import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          children: [
            ListTile(
              title: const Text("Change Password"),
              leading: const Icon(Icons.lock),
              onTap: () {
                // Navigate to Change Password Page
                // This can be another screen for changing password
              },
            ),
            ListTile(
              title: const Text("Update Profile"),
              leading: const Icon(Icons.person),
              onTap: () {
                // Navigate to Update Profile Page
                // This can be another screen for updating the user profile
              },
            ),
            ListTile(
              title: const Text("Notification Preferences"),
              leading: const Icon(Icons.notifications),
              onTap: () {
                // Navigate to Notification Preferences
              },
            ),
            ListTile(
              title: const Text("Privacy Settings"),
              leading: const Icon(Icons.lock_open),
              onTap: () {
                // Navigate to Privacy Settings Page
              },
            ),
          ],
        ),
      ),
    );
  }
}
