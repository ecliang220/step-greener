// main_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/widgets/app_bar.dart';
import 'package:google_maps_in_flutter/widgets/menu_drawer.dart';

enum PageType {
  map,
  myStepLog,
  rewards,
  help,
  settings
}

class PageTemplate extends StatefulWidget {
  final Widget page;
  final PageType pageType;
  const PageTemplate({super.key, required this.page, required this.pageType});

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  IconData _menuIcon = Icons.menu; // Initial hamburger menu icon

  // Function to toggle the menu icon and open the drawer
  void _toggleMenuIcon() {
    setState(() {
      if (_menuIcon == Icons.menu) {
        _menuIcon = Icons.close; // Change to X (close icon)
      } else {
        _menuIcon = Icons.menu; // Change back to hamburger menu
      }
    });

    // Use a Builder widget to ensure scaffoldKey is accessed after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scaffoldKey.currentState != null) {
        _scaffoldKey.currentState?.openDrawer(); // Open the drawer after build
        if (_menuIcon == Icons.menu) {
          _scaffoldKey.currentState?.closeDrawer();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StepGreenerAppBar(
        onMenuIconPressed: _toggleMenuIcon, // Pass function to change icon
        menuIcon: _menuIcon,
        pageType: widget.pageType,
      ),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: MenuDrawer(
          onMenuItemSelected: () {
            setState(() {
              _menuIcon = Icons.menu; // Reset icon back to hamburger
            });
            _scaffoldKey.currentState?.closeDrawer(); // Close the drawer
          },
        ),
        body: Center(
          child: widget.page
        ),
      )
    );
  }
}