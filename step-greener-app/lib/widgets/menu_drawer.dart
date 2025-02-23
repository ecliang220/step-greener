// menu_drawer.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_greener/pages/profile_page.dart';
import 'package:step_greener/theme/app_colors.dart';
import 'package:step_greener/pages/locations_map_page.dart';
import 'package:step_greener/pages/my_step_log_page.dart';
import 'package:step_greener/widgets/page_template.dart';
import 'package:step_greener/pages/rewards_page.dart';
import 'package:step_greener/pages/help_page.dart';
import 'package:step_greener/pages/settings_page.dart';

class MenuDrawer extends StatefulWidget {
  final VoidCallback onMenuItemSelected;

  const MenuDrawer({super.key, required this.onMenuItemSelected});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
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
                height: 70, 
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackground,
                    border: Border(bottom: BorderSide( color: AppColors.primaryBorder, width: 5 ))
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Main'),
                onTap: () {
                  widget.onMenuItemSelected(); // Close the drawer and change icon
                  setState(() {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                        builder: ( context ) => PageTemplate( page: LocationsMapPage(), pageType: LocationsMapPage.pageType, )
                      )
                    );
                  });
                },
              ),
              Divider(),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  widget.onMenuItemSelected(); // Close the drawer and change icon
                  setState( () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ( context ) => PageTemplate(page: ProfilePage(), pageType: ProfilePage.pageType)
                      )
                    );
                  } );
                },
              ),
              Divider(),
              ListTile(
                title: Text('My Step Log'),
                onTap: () {
                  widget.onMenuItemSelected(); // Close the drawer and change icon
                  setState( () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ( context ) => PageTemplate(page: MyStepLogPage(), pageType: MyStepLogPage.pageType)
                      )
                    );
                  } );
                },
              ),
              Divider(),
              ListTile(
                title: Text('Rewards'),
                onTap: () {
                  widget.onMenuItemSelected(); // Close the drawer and change icon
                  setState(() {
                    Navigator.pushReplacement( 
                      context, 
                      MaterialPageRoute(
                        builder: ( context ) => PageTemplate(page: RewardsPage(), pageType: RewardsPage.pageType)
                      ) 
                    );
                  });
                },
              ),
              Divider(),
              ListTile(
                title: Text('Help'),
                onTap: () {
                  widget.onMenuItemSelected(); // Close the drawer and change icon
                  setState(() {
                    Navigator.pushReplacement( 
                      context, 
                      MaterialPageRoute(
                        builder: ( context ) => PageTemplate(page: HelpPage(), pageType: HelpPage.pageType)
                      )
                    );
                  });
                },
              ),
              Divider(),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  widget.onMenuItemSelected(); // Close the drawer and change icon
                  setState(() {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(
                        builder: ( context ) => PageTemplate(page: SettingsPage(), pageType: SettingsPage.pageType,)
                      )
                    );
                  });
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