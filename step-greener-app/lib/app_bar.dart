// my_app_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_in_flutter/app_colors.dart';
import 'package:google_maps_in_flutter/points_display.dart';

class StepGreenerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData menuIcon;
  final VoidCallback onMenuIconPressed;

  const StepGreenerAppBar({
    super.key,
    required this.onMenuIconPressed,
    required this.menuIcon,
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
                Row( // Place logo and App Title close together
                  children: [
                    Image.asset(
                      'assets/images/right_footprint.png',
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
                ),
                // SizedBox(width: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: PointsDisplay()
                ),
              ],
            ),
          );
        }
      ),
      title: null,
      backgroundColor: AppColors.primaryBackground,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.primaryBorder, // You can customize the color
          width: 5.0,          // You can adjust the thickness
        ),
      ),
    );
  }
}
