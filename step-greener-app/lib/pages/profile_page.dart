import 'package:flutter/material.dart';
import 'package:step_greener/widgets/page_template.dart';

// TODO: Implement
class ProfilePage extends StatefulWidget {
  static const PageType pageType = PageType.profile;
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text( "Profile Page" ),);
  }
}