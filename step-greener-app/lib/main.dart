import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/login_page.dart';
import 'package:google_maps_in_flutter/page_template.dart';
import 'package:google_maps_in_flutter/splash_screen.dart';

// helloooooo dis is our App :3
StepGreenerApp stepGreenerApp = StepGreenerApp();

void main() {
  runApp(stepGreenerApp);
}

class StepGreenerApp extends StatelessWidget {
  const StepGreenerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: PageTemplate() // Takes a page widget as parameter as necessary
    );
  }
}