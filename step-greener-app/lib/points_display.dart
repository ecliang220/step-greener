import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/app_colors.dart';

class PointsDisplay extends StatelessWidget {
  // TODO: Once backend implemented, replace with rest call to retrieve points
  final int totalPoints = 11287; // Example number of points

  const PointsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(5), // Padding inside the container
            height: 35,
            width: 85,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryBorder, width: 3), // Border around the container
              borderRadius: BorderRadius.circular(12),
              color: AppColors.secondaryBackground,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '$totalPoints', // Displaying the total points
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/points_icon.png',
                    height: 30, 
                  ),
                ),
              ],
            ),
          );

  }
}
