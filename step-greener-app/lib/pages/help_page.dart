import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/widgets/page_template.dart';

// TODO: Implement
class HelpPage extends StatefulWidget {
  static const PageType pageType = PageType.help;
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text( "Help!!! :o" ),);
  }
}