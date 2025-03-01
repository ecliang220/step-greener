import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:step_greener/theme/app_colors.dart';
import 'package:step_greener/widgets/page_template.dart';

class LocationsMapPage extends StatelessWidget {
  static const PageType pageType = PageType.map;
  const LocationsMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(35.7846, -78.6750), // Initial location: NCSU Raleigh
          initialZoom: 13.0,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all,
          ),

        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(  // Fill in with markers for Greenspaces that qualify for our app :)
            rotate: true,
            markers: [
              Marker(
                point: LatLng(35.7670857, -78.6828221), // Display location: Lake Raleigh
                child: IconButton(
                  icon: Icon(Icons.directions_walk), 
                  color: AppColors.primaryText, 
                  iconSize: 40.0,
                  onPressed: () {
                    // Handle open Record Walk Overlay
                  }  
                )
              ),
              Marker(
                point: LatLng(35.782215, -78.663858), // Display location: Pullen Park
                child: IconButton(
                  icon: Icon(Icons.directions_walk), 
                  color: AppColors.primaryText, 
                  iconSize: 40.0,
                  onPressed: () {
                    // Handle open Record Walk Overlay
                  }  
                )
              ),
              Marker(
                point: LatLng(35.769938, -78.652873), // Display location: Dorothea Dix Park
                child: IconButton(
                  icon: Icon(Icons.directions_walk), 
                  color: AppColors.primaryText, 
                  iconSize: 40.0,
                  onPressed: () {
                    // Handle open Record Walk Overlay
                  }  
                )
              ),
              Marker(
                point: LatLng(35.762377, -78.714039), // Display location: Lake Johnson
                child: IconButton(
                  icon: Icon(Icons.directions_walk), 
                  color: AppColors.primaryText, 
                  iconSize: 40.0,
                  onPressed: () {
                    // Handle open Record Walk Overlay
                  }  
                )
              ),
              Marker(
                point: LatLng(35.871218, -78.762510), // Display location: William B Umstead State Park  
                child: IconButton(
                  icon: Icon(Icons.directions_walk), 
                  color: AppColors.primaryText, 
                  iconSize: 40.0,
                  onPressed: () {
                    // Handle open Record Walk Overlay
                  }  
                )
              ),
              Marker(
                point: LatLng(35.794491, -78.699914), // Display location: JC Raulston Arboretum
                child: IconButton(
                  icon: Icon(Icons.directions_walk), 
                  color: AppColors.primaryText, 
                  iconSize: 40.0,
                  onPressed: () {
                    // Handle open Record Walk Overlay
                  }  
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}