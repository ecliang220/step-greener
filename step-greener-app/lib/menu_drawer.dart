// menu_drawer.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_in_flutter/app_colors.dart';

class MenuDrawer extends StatelessWidget {
  final VoidCallback onMenuItemSelected;

  const MenuDrawer({super.key, required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(color: AppColors.primaryBorder, width: 5)
          )
        ),
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 80, 
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackground,
                    border: Border(bottom: BorderSide( color: AppColors.primaryBorder, width: 5 ))
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('My Step Log'),
                onTap: () {
                  onMenuItemSelected(); // Close the drawer and change icon
                },
              ),
              Divider(),
              ListTile(
                title: Text('Rewards'),
                onTap: () {
                  onMenuItemSelected(); // Close the drawer and change icon
                },
              ),
              Divider(),
              ListTile(
                title: Text('Help'),
                onTap: () {
                  onMenuItemSelected(); // Close the drawer and change icon
                },
              ),
              Divider(),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  onMenuItemSelected(); // Close the drawer and change icon
                },
              ),
              Divider(),
            ],
          ),
        )
      )
    );
  }
}