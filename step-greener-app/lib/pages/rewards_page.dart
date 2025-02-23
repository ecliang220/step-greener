import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/widgets/page_template.dart';

// TODO: Implement
class RewardsPage extends StatefulWidget {
  static const PageType pageType = PageType.rewards;
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("My Rewards"),);
  }
}