import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_greener/pages/login_page.dart';

void main() {
  runApp(StepGreenerApp());
}

class StepGreenerApp extends StatelessWidget {
  const StepGreenerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _footprintYPosition = -200; // Initial Y position off-screen

  @override
  void initState() {
    super.initState();
    // Delay the animation for a few seconds
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        _footprintYPosition = 0; // Move the footprint into the screen
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 195, 150),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Footprint animation (slamming down effect)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              top: _footprintYPosition,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Footprint image to the left of StepGreener text
                  Image.asset(
                    'assets/images/greenfootprint.png', // Footprint image
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 1), // Space between footprint and text
                  Text(
                    "StepGreener",
                    style: GoogleFonts.kaushanScript(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 109, 44),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Tagline text with fade-in effect
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 800),
                child: Text(
                  "Track your steps, earn rewards, and take steps towards a healthier, greener you!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 109, 44),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
