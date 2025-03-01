import 'package:flutter/material.dart';
import 'package:step_greener/widgets/page_template.dart';

/// Settings page that allows users to manage their account, notifications, and more.
class SettingsPage extends StatefulWidget {
  static const PageType pageType = PageType.settings;
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            /// Profile Section - Displays user's initials, name, and email
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFF006D2F),
                  child: Text(
                    'SG', // Initials inside the circle
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Name',
                      style: TextStyle(
                        color: Color(0xFF006D2F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'example@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF006D2F),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF006D2F)), // Small right arrow
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            /// Settings Options - List of settings with icons
            Expanded(
              child: ListView(
                children: [
                  settingsTile('Account', Icons.person, context),
                  settingsTile('Notifications', Icons.notifications, context),
                  settingsTile('Points Activity', Icons.energy_savings_leaf, context),
                  settingsTile('Refer a Friend', Icons.share, context),
                  settingsTile('Privacy Notice', Icons.privacy_tip, context),
                  settingsTile('Rate Our App', Icons.star, context),
                  settingsTile('Delete Account', Icons.delete, context),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// Logout Button - Styled as a rounded green button
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006D2F),
                  shape: const StadiumBorder(), // Fully rounded button
                  padding: EdgeInsets.symmetric(vertical: 12), // Increases button height
                ),
                onPressed: () {}, // No functionality yet
                child: Text(
                  'Step Out',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a tappable settings option with an icon and title
  Widget settingsTile(String title, IconData icon, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5), // Adds spacing between items
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF006D2F)), // Icon for each setting
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFF006D2F),
            fontSize: 16,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF006D2F), size: 16), // Right arrow
        onTap: () {}, // Functionality to be added
      ),
    );
  }
}