import 'package:flutter/material.dart';
import 'package:step_greener/widgets/page_template.dart';

// TODO: Implement
class SettingsPage extends StatefulWidget {
  static const PageType pageType = PageType.settings;
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text( "Settings" ),);
  }
}