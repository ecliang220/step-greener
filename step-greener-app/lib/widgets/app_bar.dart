// my_app_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_greener/theme/app_colors.dart';
import 'package:step_greener/widgets/page_template.dart';
import 'package:step_greener/widgets/points_display.dart';

class StepGreenerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData menuIcon;
  final VoidCallback onMenuIconPressed;
  final PageType pageType;

  const StepGreenerAppBar({
    super.key,
    required this.onMenuIconPressed,
    required this.menuIcon, 
    required this.pageType,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(menuIcon),
                  onPressed: onMenuIconPressed,
                  iconSize: 50,
                ),
                Builder(builder: (context)  {
                  if ( pageType == PageType.myStepLog ) {
                    return Text("My Step Log", 
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText
                        )
                      ) 
                    );
                  } else if ( pageType == PageType.rewards ) {
                    return Text("Rewards", 
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText
                        )
                      ) 
                    );
                  } else if ( pageType == PageType.profile ) {
                    return Text("Profile", 
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText
                        )
                      ) 
                    );
                  } else if ( pageType == PageType.help ) {
                    return Text("Help", 
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText
                        )
                      ) 
                    );
                  } else if ( pageType == PageType.settings ) {
                    return Text("Settings", 
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText
                        )
                      ) 
                    );
                  } else { // Default to StepGreener main AppBar
                    return Row( // Place logo and App Title close together
                      children: [
                        Image.asset(
                          'assets/images/greenfootprint.png',
                          width: width * 0.06
                        ),
                        Text("StepGreener", 
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryText
                            )
                          ) 
                        )
                      ]
                    );
                  }
                },),
                // SizedBox(width: 10),
                Builder(
                  builder: ( context ) {
                    if ( pageType == PageType.map || pageType == PageType.rewards ) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: PointsDisplay(points: 11287) // TODO: Example number of points
                      );
                    } else {
                      return SizedBox(width: 50,); // Match width of menu icon to center title
                    }
                  }
                )
              ],
            ),
          );
        }
      ),
      title: null,
      backgroundColor: AppColors.primaryBackground,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.primaryBorder,
          width: 5.0,
        ),
      ),
    );
  }
}
