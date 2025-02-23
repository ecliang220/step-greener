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
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(menuIcon),
        onPressed: onMenuIconPressed,
        iconSize: 50,
      ),
      title: Row(
        children: [
          Image.asset(
            'assets/images/right_footprint.png',
            width: 30
          ),
          Text("StepGreener", 
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryText
              )
            ) 
          ),
          SizedBox(width: 10),
          PointsDisplay(),
        ],
      ),
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_in_flutter/app_colors.dart';

// class StepGreenerAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final GlobalKey<ScaffoldState> scaffoldkey;
//   final GlobalKey<StepGreenerAppBarState> appBarKey;

//   const StepGreenerAppBar({super.key, required this.scaffoldkey, required this.appBarKey});

//   @override
//   State<StepGreenerAppBar> createState() => StepGreenerAppBarState();
  
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight + 10); // Add 10 for padding below title: StepGreener
// }

// class StepGreenerAppBarState extends State<StepGreenerAppBar> {
//   bool isMenuOpen = false;

//   void toggleMenu() {
//     setState( () {
//       isMenuOpen = !isMenuOpen;
//       if ( isMenuOpen ) {
//         widget.scaffoldkey.currentState?.openDrawer();
//       } else {
//         // widget.scaffoldkey.currentState?.openEndDrawer();
//         widget.scaffoldkey.currentState?.closeDrawer();
//       }
//     } );
//   }
//   void changeIconState() {

//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       key: widget.appBarKey,
//       leading: IconButton(
//         icon: Icon( isMenuOpen ? Icons.close : Icons.menu ),
//         onPressed: toggleMenu,
//         iconSize: 50,
//       ),
//       title: Row(
//         children: [
//           Image.asset(
//             'assets/images/right_footprint.png',
//             width: 30
//           ),
//           Text("StepGreener", 
//             style: GoogleFonts.poppins(
//               textStyle: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.primaryText
//               )
//             ) 
//           ),
//         ],
//       ),
//       backgroundColor: AppColors.primaryBackground,
//       elevation: 2,
//     );
      
//   }
// }