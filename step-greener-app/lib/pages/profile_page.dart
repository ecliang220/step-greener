import 'package:flutter/material.dart';
import 'package:step_greener/widgets/page_template.dart';
import 'package:step_greener/pages/settings_page.dart'; // Import SettingsPage

class ProfilePage extends StatefulWidget {
  static const PageType pageType = PageType.profile;
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture and Name Section
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFF006D2F),
                  child: Text(
                    'SG', // Initials inside circle
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Your Name',
                  style: TextStyle(
                    color: Color(0xFF006D2F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // List of Profile Details
            Expanded(
              child: ListView(
                children: [
                  profileTile(Icons.person, 'Username', value: 'Username'),
                  profileTile(Icons.star, 'Total Points', value: '11,287'),
                  profileTile(Icons.directions_walk, 'Total Steps', value: '11,692,278'),
                  profileTile(Icons.location_on, 'Locations Visited', hasArrow: true),
                  profileTile(Icons.calendar_today, 'Date Joined', value: '01/05/2025'),
                  profileTile(Icons.settings, 'Settings', hasArrow: true, navigateToSettings: true), // Enable navigation
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a profile info tile with an icon, label, and optional arrow
  Widget profileTile(IconData icon, String label, {String value = '', bool hasArrow = false, bool navigateToSettings = false}) {
    bool noColon = label == 'Settings' || label == 'Locations Visited'; // Exclude ":" for these labels

    return GestureDetector(
      onTap: () {
        if (navigateToSettings) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()), // Navigate to Settings
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF006D2F)), // Icon on the left
            SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: noColon ? label : '$label: ', // Remove ":" for Settings & Locations Visited
                  style: TextStyle(
                    color: Color(0xFF006D2F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    if (!noColon) // Only add value if ":" is present
                      TextSpan(
                        text: value,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                  ],
                ),
              ),
            ),
            if (hasArrow)
              Icon(Icons.arrow_forward_ios, color: Color(0xFF006D2F), size: 16), // Right arrow for navigation
          ],
        ),
      ),
    );
  }

  /// Creates a profile info tile with an icon, label, and optional arrow
  Widget profileTile(IconData icon, String label, {String value = '', bool hasArrow = false, bool navigateToSettings = false}) {
    bool noColon = label == 'Settings' || label == 'Locations Visited'; // Exclude ":" for these labels

    return GestureDetector(
      onTap: () {
        if (navigateToSettings) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()), // Navigate to Settings
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF006D2F)), // Icon on the left
            SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: noColon ? label : '$label: ', // Remove ":" for Settings & Locations Visited
                  style: TextStyle(
                    color: Color(0xFF006D2F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    if (!noColon) // Only add value if ":" is present
                      TextSpan(
                        text: value,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                  ],
                ),
              ),
            ),
            if (hasArrow)
              Icon(Icons.arrow_forward_ios, color: Color(0xFF006D2F), size: 16), // Right arrow for navigation
          ],
        ),
      ),
    );
  }
}
