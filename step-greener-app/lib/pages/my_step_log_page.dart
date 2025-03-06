import 'package:flutter/material.dart';
import 'package:step_greener/widgets/page_template.dart';

// TODO: Implement
class MyStepLogPage extends StatefulWidget {
  static const PageType pageType = PageType.myStepLog;

  const MyStepLogPage({super.key});
  @override
  State<MyStepLogPage> createState() => _MyStepLogPageState();
}

class _MyStepLogPageState extends State<MyStepLogPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text( "My Step Log" ),);
  }
}