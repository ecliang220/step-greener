import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_greener/pages/splash_screen.dart';

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
      // home: PageTemplate(page: MyStepLogPage(), pageType: MyStepLogPage.pageType,)
      home: SplashScreen()
    );
  }
}