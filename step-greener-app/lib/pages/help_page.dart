import 'package:flutter/material.dart';
import 'package:step_greener/widgets/page_template.dart';

class HelpPage extends StatefulWidget {
  static const PageType pageType = PageType.help;
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFB2E2E2),
        appBar: AppBar(
          title: const Text(
            'FAQ',
            style: TextStyle(color: Color(0xFF006D2F)),
          ),
          backgroundColor: const Color(0xFFB2E2E2),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FAQ Boxes
              faqBox('How do I create an account'),
              const SizedBox(height: 10),
              faqBox('Is StepGreener free?'),
              const SizedBox(height: 10),
              faqBox('Can I use the app offline?'),
              const SizedBox(height: 10),
              faqBox('Is my data safe with StepGreener?'),
              const SizedBox(height: 10),
              faqBox('What should I do if the app isn’t working?'),
              const SizedBox(height: 30),

              // Contact Us
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006D2F),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'stepgreener@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF006D2F),
                ),
              ),
              const SizedBox(height: 20),
              // Message Textbox and Submit Button
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your message...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
    
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Submit action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006D2F),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FAQ Box Widget
  Widget faqBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF006D2F),
              fontSize: 16,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: const Color(0xFF006D2F),
          ),
        ],
      ),
    );
  }
}