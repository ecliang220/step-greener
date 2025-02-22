import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 226, 226), // Background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // StepGreener logo and text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/right_footprint.png', width: 50), // Footprint image
                SizedBox(width: 8), // Space between image and text
                Text(
                  'Step\nGreener',
                  style: GoogleFonts.kaushanScript(
                    color: Color.fromARGB(255,33, 125, 35), // Text color
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.5, // Adjust line spacing for "Step" and "Greener"
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 40), // Space after logo

            // Username section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Username:', style: GoogleFonts.raleway(fontSize: 16)),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'example@gmail.com',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for "Forgot Username?"
                },
                child: Text(
                  'Forgot Username?',
                  style: GoogleFonts.raleway(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between sections

            // Password section
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Password:', style: TextStyle(fontSize: 16)),
            ),
            TextField(
              obscureText: true, // Bullets for password input
              decoration: InputDecoration(
                hintText: '••••••••••••', // 10 bullet placeholder
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for "Forgot Password?"
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40), // Space before button

            // Step In button inside a green ellipse
            ElevatedButton(
              onPressed: () {
                // Add functionality for the "Step In" button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF006D2C), // Green ellipse background color
                shape: StadiumBorder(), // Elliptical shape
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Step In!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 40), // Space before "Create Account"

            // "Don't have account?" and "Create Account" link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    // Add functionality for "Create Account"
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
