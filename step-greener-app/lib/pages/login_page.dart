import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_greener/pages/locations_map_page.dart';
import 'package:step_greener/widgets/page_template.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 226, 226), // Background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Spacer to move StepGreener above the middle
            const SizedBox(height: 150),

            // StepGreener logo and text
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/greenfootprint.png', width: 30), // Footprint image
                    const SizedBox(width: 2), // Space between image and text
                    Text(
                      'Step',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 33, 125, 35),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Greener',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 33, 125, 35), // Text Color
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 50), // Space after logo

            // Username section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Username:',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 46, 105, 48),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'example@gmail.com',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for "Forgot Username?"
                },
                child: Text(
                  'Forgot Username?',
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Space between sections

            // Password section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password:',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 46, 105, 48),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TextField(
              obscureText: true, // Bullets for password input
              decoration: InputDecoration(
                hintText: '••••••••••••',
                border: OutlineInputBorder(),
                fillColor: Colors.white, // Set background color to white
                filled: true, // Enable the background color
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for "Forgot Password?"
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Space before button

            // Step In button
            ElevatedButton(
              onPressed: () {
                // Add functionality for the "Step In" button
                // TODO: Replace with authentication process
                setState(() {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(  // Temporarily allow login without account verification
                      builder: ( context ) => PageTemplate( page: LocationsMapPage(), pageType: LocationsMapPage.pageType, ) )
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D2C),
                shape: const StadiumBorder(), // Elliptical shape
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Step In!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 60), // Space before "Create Account"

            // "Don't have account?" and "Create Account" link stacked
            Column(
              children: [
                Text(
                  "Don't have account?",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 46, 105, 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add functionality for "Create Account"
                  },
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 46, 105, 48),
                      fontWeight: FontWeight.bold,
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

