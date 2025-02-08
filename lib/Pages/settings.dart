import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          children: [
            ListTile(
              title: Text("Change Password"),
              leading: Icon(Icons.lock),
              onTap: () {
                // Navigate to Change Password Page
                // This can be another screen for changing password
              },
            ),
            ListTile(
              title: Text("Update Profile"),
              leading: Icon(Icons.person),
              onTap: () {
                // Navigate to Update Profile Page
                // This can be another screen for updating the user profile
              },
            ),
            ListTile(
              title: Text("Notification Preferences"),
              leading: Icon(Icons.notifications),
              onTap: () {
                // Navigate to Notification Preferences
              },
            ),
            ListTile(
              title: Text("Privacy Settings"),
              leading: Icon(Icons.lock_open),
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
