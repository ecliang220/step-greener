import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:step_greener/widgets/page_template.dart';

// TODO: Implement
class LocationsMapPage extends StatefulWidget {
  static const PageType pageType = PageType.map;
  const LocationsMapPage({super.key});

  @override
  State<LocationsMapPage> createState() => _LocationsMapPageState();
}

class _LocationsMapPageState extends State<LocationsMapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
}